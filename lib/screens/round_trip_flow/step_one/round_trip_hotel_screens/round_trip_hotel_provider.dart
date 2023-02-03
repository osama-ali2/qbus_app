// Created by Tayyab Mughal on 05/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/hotel/HotelRoomResponse.dart';
import 'package:qbus/models/trips/OneWayOrdersTripResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/resources/resources.dart';
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
  // List<Map<String, dynamic>> newHotelBody = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  /// Load All Hotels
  Future<void> getHotels({required int tripId}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var url = "$hotelRoomApiUrl$tripId";
      debugPrint("URL: $url");
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
      _logger.e("onHotelRoomResponseError:${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
