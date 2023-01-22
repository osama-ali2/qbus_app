// Created by Tayyab Mughal on 02/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/passenger_models/GetCountriesResponse.dart';
import 'package:qbus/models/passenger_models/IdentityProofTypesResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/widgets/loader.dart';

class RoundTripPassengerProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);

  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  bool isIdentityTypesLoaded = false;
  bool isCountriesLoaded = false;

  // Identity Proof Types Lists
  List<String> identityProofTypeNameList = [];
  List<String> identityProofTypeIdList = [];
  List<Map<String, dynamic>> identityProofTypesMapList = [];

  List<int> userIdentityProofTypeId = [];
  List<int> userCountryId = [];

  // Country Lists
  List<String> countryNameList = [];
  List<String> countryIdList = [];
  List<Map<String, dynamic>> countryMapList = [];

  IdentityProofTypesResponse identityProofTypesResponse =
      IdentityProofTypesResponse();
  GetCountriesResponse getCountriesResponse = GetCountriesResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  /// Get Identity Proof Types
  Future<void> getIdentityProofTypes() async {
    try {
      // Clear the list
      identityProofTypeNameList.clear();
      identityProofTypeIdList.clear();
      identityProofTypesMapList.clear();

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var url = identityProofTypesApiUrl;
      debugPrint("URL: $url");
      debugPrint("Header: $header");

      identityProofTypesResponse = await MyApi.callGetApi(
        url: url,
        myHeaders: header,
        modelName: Models.identityProofTypesModel,
      );

      if (identityProofTypesResponse.code == 1) {
        _logger.i(
            "identityProofTypesResponse: ${identityProofTypesResponse.toJson()}");
        var l = identityProofTypesResponse.data!.identityProofTypes!.length;
        debugPrint("l:$l");
        for (int i = 0; i < l; i++) {
          var name = identityProofTypesResponse
              .data!.identityProofTypes![i].name!.en
              .toString();
          var id = identityProofTypesResponse.data!.identityProofTypes![i].id!
              .toString();

          Map<String, dynamic> map = {
            "id": id,
            "name": name,
          };

          _logger.i("map:$map");
          identityProofTypeNameList.add(name);
          identityProofTypeIdList.add(id);
          identityProofTypesMapList.add(map);
        }

        isIdentityTypesLoaded = true;
        notifyListeners();
      } else {
        _logger.i("identityProofTypesResponse: Something wrong");
      }
    } catch (e) {
      _logger.e("onErrorIdentityProofTypesResponse:${e.toString()}");
    }
  }

  /// Get Countries List
  Future<void> getCountriesList() async {
    try {
      _loader.showLoader(context: context);
      // Clear the list
      countryNameList.clear();
      countryIdList.clear();
      countryMapList.clear();

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var url = getCountriesApiUrl;
      _logger.i("URL: $url");

      getCountriesResponse = await MyApi.callGetApi(
        url: url,
        myHeaders: header,
        modelName: Models.getCountriesModel,
      );

      if (identityProofTypesResponse.code == 1) {
        _logger
            .i("getCountriesResponse: ${identityProofTypesResponse.toJson()}");

        var l = getCountriesResponse.data!.countries!.length;
        debugPrint("l:$l");
        for (int i = 0; i < l; i++) {
          var name =
              getCountriesResponse.data!.countries![i].name!.en.toString();
          var id = getCountriesResponse.data!.countries![i].id!.toString();

          Map<String, dynamic> map = {
            "id": id,
            "name": name,
          };

          _logger.i("map:$map");
          countryNameList.add(name);
          countryIdList.add(id);
          countryMapList.add(map);
        }
        _loader.hideLoader(context!);

        isCountriesLoaded = true;
        notifyListeners();
      } else {
        _logger.e("getCountriesResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("onErrorGetCountriesResponse:${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
