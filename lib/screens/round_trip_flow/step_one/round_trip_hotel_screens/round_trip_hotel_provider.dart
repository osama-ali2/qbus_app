// Created by Tayyab Mughal on 05/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/hotel/hotel_room_response.dart';
import 'package:qbus/models/trips/OneWayOrdersTripResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/widgets/loader.dart';

class RoundTripHotelProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  HotelRoomResponse hotelRoomResponse = HotelRoomResponse();
  OneWayOrdersTripResponse oneWayOrdersTripResponse =
      OneWayOrdersTripResponse();

  // Checks
  bool isHotelLoaded = false;
  bool isOneWayOrderTripSaved = false;

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
      // var url = "$hotelRoomApiUrl$tripId";
      var url = hotelRoomApiUrl;
      debugPrint("URL: $url");
      debugPrint("Header: $header");

      hotelRoomResponse = await MyApi.callGetApi(
        url: url,
        myHeaders: header,
        modelName: Models.hotelRoomModel,
      );

      if (hotelRoomResponse.code == 1) {
        _logger.i("hotelRoomResponse: ${hotelRoomResponse.toJson()}");

        var length = hotelRoomResponse.data!.rooms!.length;
        for (int i = 0; i < length; i++) {
          //Add Initially Values
          Map<String, dynamic> demoData = {
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

  Future<void> oneWayOrderTrip({
    required String tripId,
    required String passengerCounts,
    required List<Map<String, dynamic>> paramPassengerBody,
    required List<Map<String, dynamic>> additionalList,
  }) async {
    try {
      _loader.showLoader(context: context);

      // Headers
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      _logger.i("trips.id: $tripId");
      _logger.i("additionalList: ${additionalList.map((e) => e)}");
      _logger.i("paramPassengerBody: ${paramPassengerBody.map((e) => e)}");
      _logger.i("hotelRoomBody: ${hotelRoomBody.map((e) => e)}");

      final newHotelBody = [];
      hotelRoomBody.firstWhere((element) {
        if (element['rooms_number'] > 0 && element['days'] > 0) {
          debugPrint("elementSelected:$element");
          newHotelBody.add(element);
          return true;
        }
        return false;
      });

      // API->Body
      final newBody = {
        "trip_id": tripId,
        "count": passengerCounts,
        "code": "SALE10",
        "additional": additionalList,
        "passengers": paramPassengerBody,
        "hotel_rooms": newHotelBody, //hotelRoomBody,
        "user_notes": ""
      };

      var url = oneWayOrderTripApiUrl;
      debugPrint("URL: $url");
      _logger.i("newBody: $newBody");
      oneWayOrdersTripResponse = await MyApi.callPostApi(
        url: url,
        myHeaders: header,
        body: newBody,
        modelName: Models.oneWayOrderTripModel,
      );

      if (oneWayOrdersTripResponse.code == 1) {
        _logger.i(
            "oneWayOrdersTripResponse: ${oneWayOrdersTripResponse.toJson()}, ${oneWayOrdersTripResponse.message.toString()}");

        Toasts.getSuccessToast(
          text: oneWayOrdersTripResponse.message.toString(),
        );

        //clear the data lists
        additionalList.clear();
        paramPassengerBody.clear();
        hotelRoomBody.clear();

        isOneWayOrderTripSaved = true;
        _loader.hideLoader(context!);
        notifyListeners();
      } else {
        _logger.e("oneWayOrdersTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("oneWayOrdersTripResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
