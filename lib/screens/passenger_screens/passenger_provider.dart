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
import 'package:qbus/res/strings.dart';
import 'package:qbus/widgets/loader.dart';
import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';

class PassengerProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);

  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  bool isIdentityTypesLoaded = false;
  bool isCountriesLoaded = false;

  List<int> selectAdditionalList = [];
  List<Map<String, dynamic>> additionalList = [];

  IdentityProofTypesResponse identityProofTypesResponse =
      IdentityProofTypesResponse();
  GetCountriesResponse getCountriesResponse = GetCountriesResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getIdentityProofTypes() async {
    try {
      _loader.showLoader(context: context);
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
        _logger.d(
            "identityProofTypesResponse: ${identityProofTypesResponse.toJson()}");
        _loader.hideLoader(context!);
        isIdentityTypesLoaded = true;
        notifyListeners();
      } else {
        _logger.i("identityProofTypesResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("onErrorIdentityProofTypesResponse:${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> getCountriesList() async {
    try {
      // _loader.showLoader(context: context);
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var url = getCountriesApiUrl;
      debugPrint("URL: $url");
      debugPrint("Header: $header");

      getCountriesResponse = await MyApi.callGetApi(
        url: url,
        myHeaders: header,
        modelName: Models.getCountriesModel,
      );

      if (identityProofTypesResponse.code == 1) {
        _logger
            .d("getCountriesResponse: ${identityProofTypesResponse.toJson()}");
        // _loader.hideLoader(context!);
        isCountriesLoaded = true;
        notifyListeners();
      } else {
        _logger.i("getCountriesResponse: Something wrong");
        // _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("onErrorGetCountriesResponse:${e.toString()}");
      // _loader.hideLoader(context!);
    }
  }
}
