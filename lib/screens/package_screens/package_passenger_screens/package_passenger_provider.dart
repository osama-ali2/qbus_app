// Created by Tayyab Mughal on 02/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/packages/PackageOrderResponse.dart';
import 'package:qbus/models/passenger_models/GetCountriesResponse.dart';
import 'package:qbus/models/passenger_models/IdentityProofTypesResponse.dart';
import 'package:qbus/network_manager/network_manager.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/widgets/loader.dart';

class PackagePassengerProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);

  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  bool isIdentityTypesLoaded = false;
  bool isCountriesLoaded = false;
  bool isPackageOrdersSaved = false;

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
  PackageOrderResponse packageOrderResponse = PackageOrderResponse();

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
          // var name = identityProofTypesResponse
          //     .data!.identityProofTypes![i].name!.en
          //     .toString();

          var name = identityProofTypesResponse
              .data!.identityProofTypes![i].name!.ar
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
      // _logger.i("Header: $header");

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
          // var name =
          //     getCountriesResponse.data!.countries![i].name!.en.toString();

          var name =
              getCountriesResponse.data!.countries![i].name!.ar.toString();

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
        _logger.i("getCountriesResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("onErrorGetCountriesResponse:${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  /// Skip Hotel One From Screen
  Future<void> skipBothHotelFromScreen({
    required int packageId,
    required int passengerCounts,
    required List<Map<String, dynamic>> additionalList,
    required List<Map<String, dynamic>> paramPassengerBody,
  }) async {
    try {
      _loader.showLoader(context: context);

      // Headers
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      _logger.i("packageId: $packageId");
      var url = packageOrdersApiUrl;
      debugPrint("URL: $url");

      _logger.i("packageId: $packageId");
      _logger.i("additionalList: ${additionalList.map((e) => e)}");
      _logger.i("paramPassengerBody: ${paramPassengerBody.map((e) => e)}");

      // // //TODO: Checkout hotel One issue,
      // var newHotelOneBody = [];
      // for (int i = 0; i < hotelOneBody.length; i++) {
      //   if (hotelOneBody[i]['rooms_number'] > 0 &&
      //       hotelOneBody[i]['days'] > 0) {
      //     newHotelOneBody.add(hotelOneBody[i]);
      //     _logger.i("newHotelOneBody:$hotelOneBody");
      //   }
      // }

      final updateBody = {
        "package_id": packageId,
        "count": passengerCounts,
        "code": "",
        "passengers": paramPassengerBody,
        "additional": additionalList,
        "hotel_rooms_one": [],
        "hotel_rooms_two": [],
        "user_notes": ""
      };

      _logger.i("apiBody:$updateBody");

      packageOrderResponse = await MyApi.callPostApi(
        url: url,
        myHeaders: header,
        body: updateBody,
        modelName: Models.packageOrderModel,
      );

      if (packageOrderResponse.code == 1) {
        _logger.i(
            "packageOrderResponse: ${packageOrderResponse.toJson()}, ${packageOrderResponse.message.toString()}");

        Toasts.getSuccessToast(
          text: packageOrderResponse.message.toString(),
        );

        isPackageOrdersSaved = true;

        //clear the data lists
        additionalList.clear();
        paramPassengerBody.clear();

        _loader.hideLoader(context!);
        notifyListeners();
      } else {
        _logger.e("packageOrderResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("savePackageOrdersError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
