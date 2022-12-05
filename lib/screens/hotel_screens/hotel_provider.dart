// Created by Tayyab Mughal on 05/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/hotel/hotel_room_response.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/widgets/loader.dart';

import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';

class HotelProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  HotelRoomResponse hotelRoomResponse = HotelRoomResponse();

  bool isHotelLoaded = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

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
        _logger.d("hotelRoomResponse: ${hotelRoomResponse.toJson()}");
        _loader.hideLoader(context!);
        isHotelLoaded = true;
        notifyListeners();
      } else {
        debugPrint("hotelRoomResponse: Something wrong");
        _logger.i("hotelRoomResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("onError:${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
