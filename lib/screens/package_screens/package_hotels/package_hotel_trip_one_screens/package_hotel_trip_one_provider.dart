// Created by Tayyab Mughal on 05/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/hotel/HotelRoomResponse.dart';
import 'package:qbus/models/packages/PackageOrderResponse.dart';
import 'package:qbus/network_manager/network_manager.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/widgets/loader.dart';

class PackageHotelTripOneProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  HotelRoomResponse hotelRoomResponse = HotelRoomResponse();
  PackageOrderResponse packageOrderResponse = PackageOrderResponse();

  // Checks
  bool isHotelLoaded = false;
  bool isPackageOrdersSaved = false;

  // UI Lists:
  List<int> selectBookingDaysList = [];
  List<int> selectNumberOfRoomsList = [];
  List<Map<String, dynamic>> hotelRoomBody = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  // Load All Hotels
  Future<void> getHotels({required int tripId}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      /// Uncomment -> make dynamic
      var url = "$hotelRoomApiUrl$tripId";
      // var url = hotelRoomApiUrl;
      debugPrint("URL: $url");
      debugPrint("Header: $header");

      hotelRoomResponse = await MyApi.callGetApi(
        url: url,
        myHeaders: header,
        modelName: Models.hotelRoomModel,
      );

      if (hotelRoomResponse.code == 1) {
        _logger.i("onHotelRoomResponse: ${hotelRoomResponse.toJson()}");

        var length = hotelRoomResponse.data!.rooms!.length;
        for (int i = 0; i < length; i++) {
          Map<String, dynamic> demoData = {
            "trip_id": 0,
            "room_id": 0,
            "rooms_number": 0,
            "days": 0
          };
          hotelRoomBody.add(demoData);
          selectBookingDaysList.add(0);
          selectNumberOfRoomsList.add(0);
        }

        _loader.hideLoader(context!);
        isHotelLoaded = true;
        notifyListeners();
      } else {
        _logger.e("hotelRoomResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("onError:${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  /// Save Package Orders
  Future<void> hotelTripOnePackageOrders({
    required int packageId,
    required int passengerCounts,
    required List<Map<String, dynamic>> additionalList,
    required List<Map<String, dynamic>> paramPassengerBody,
    // required List<Map<String, dynamic>> hotelOneBody,
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
      _logger.i("hotelRoomBody: ${hotelRoomBody.map((e) => e)}");
      _logger.i("hotelOneBody: ${hotelRoomBody.map((e) => e)}");

      //TODO: Checkout hotel One issue,
      var newHotelOneBody = [];
      for (int i = 0; i < hotelRoomBody.length; i++) {
        if (hotelRoomBody[i]['rooms_number'] > 0 &&
            hotelRoomBody[i]['days'] > 0) {
          newHotelOneBody.add(hotelRoomBody[i]);
          _logger.i("newHotelOneBody:$hotelRoomBody");
        }
      }

      final updateBody = {
        "package_id": packageId,
        "count": passengerCounts,
        "code": "",
        "passengers": paramPassengerBody,
        "additional": additionalList,
        "hotel_rooms_one": newHotelOneBody,
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
        _logger.e("oneWayOrdersTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("savePackageOrdersError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  /// Skip Hotel One From Screen
  Future<void> skipHotelOneFromScreen({
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
        _logger.e("oneWayOrdersTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("savePackageOrdersError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
