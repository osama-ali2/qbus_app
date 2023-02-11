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

class PackageHotelTripTwoProvider with ChangeNotifier {
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
  Future<void> savePackageOrders({
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

      //TODO: Checkout hotel issue,
      var newHotelBody = [];
      for (int i = 0; i < hotelRoomBody.length; i++) {
        if (hotelRoomBody[i]['rooms_number'] > 0 &&
            hotelRoomBody[i]['days'] > 0) {
          newHotelBody.add(hotelRoomBody[i]);
          _logger.i("newHotelBodyFor:$newHotelBody");
        }
        // else {
        //   newHotelBody = [];
        //   _logger.d("newHotelBodyElse:$newHotelBody");
        // }
      }

      final body = {
        "package_id": packageId,
        "count": passengerCounts,
        "code": "",
        "passengers": paramPassengerBody,
        "additional": additionalList,
        "hotel_rooms": newHotelBody,
        "user_notes": ""
      };

      _logger.i("apiBody:$body");

      packageOrderResponse = await MyApi.callPostApi(
        url: url,
        myHeaders: header,
        body: body,
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

  Future<void> skipHotelOneWayOrderTrip({
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
      _logger.i("additionalList: ${additionalList.map((e) => e)}");
      _logger.i("paramPassengerBody: ${paramPassengerBody.map((e) => e)}");

      var url = packageOrdersApiUrl;
      debugPrint("URL: $url");

      final body = {
        "package_id": 1,
        "count": passengerCounts,
        "code": "",
        "passengers": paramPassengerBody,
        "additional": additionalList,
        "hotel_rooms": [
          {"trip_id": 59, "room_id": 5, "rooms_number": 2, "days": 2},
          {"trip_id": 56, "room_id": 4, "rooms_number": 1, "days": 2}
        ],
        "user_notes": ""
      };

      debugPrint("body:$body");

      packageOrderResponse = await MyApi.callPostApi(
        url: url,
        myHeaders: header,
        body: body,
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

// // One Way Order Trip
// Future<void> oneWayOrderTrip({
//   required String tripId,
//   required String passengerCounts,
//   required List<Map<String, dynamic>> paramPassengerBody,
//   required List<Map<String, dynamic>> additionalList,
// }) async {
//   try {
//     _loader.showLoader(context: context);
//
//     // Headers
//     Map<String, dynamic> header = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $userToken"
//     };
//     _logger.i("trips.id: $tripId");
//
//     //TODO: Checkout hotel issue,
//     var newHotelBody = [];
//     for (int i = 0; i < hotelRoomBody.length; i++) {
//       if (hotelRoomBody[i]['rooms_number'] > 0 &&
//           hotelRoomBody[i]['days'] > 0) {
//         newHotelBody.add(hotelRoomBody[i]);
//         _logger.i("newHotelBodyFor:$newHotelBody");
//       }
//       // else {
//       //   newHotelBody = [];
//       //   _logger.d("newHotelBodyElse:$newHotelBody");
//       // }
//     }
//
//     //TODO: Checkout newHotelBody issue,
//     // API->Body
//     final newBody = {
//       "trip_id": tripId,
//       "count": passengerCounts,
//       "code": "",
//       "additional": additionalList,
//       "passengers": paramPassengerBody,
//       "hotel_rooms": newHotelBody, //hotelRoomBody,
//       "user_notes": ""
//     };
//     _logger.i("newBody: $newBody");
//
//     var url = oneWayOrderTripApiUrl;
//     debugPrint("URL: $url");
//     oneWayOrdersTripResponse = await MyApi.callPostApi(
//       url: url,
//       myHeaders: header,
//       body: newBody,
//       modelName: Models.oneWayOrderTripModel,
//     );
//
//     if (oneWayOrdersTripResponse.code == 1) {
//       _logger.i(
//           "oneWayOrdersTripResponse: ${oneWayOrdersTripResponse.toJson()}, ${oneWayOrdersTripResponse.message.toString()}");
//
//       Toasts.getSuccessToast(
//         text: oneWayOrdersTripResponse.message.toString(),
//       );
//
//       //clear the data lists
//       additionalList.clear();
//       paramPassengerBody.clear();
//       hotelRoomBody.clear();
//
//       isOneWayOrderTripSaved = true;
//       _loader.hideLoader(context!);
//       notifyListeners();
//     } else {
//       _logger.e("oneWayOrdersTripResponse: Something wrong");
//       _loader.hideLoader(context!);
//     }
//   } catch (e) {
//     _logger.e("oneWayOrdersTripResponseError: ${e.toString()}");
//     _loader.hideLoader(context!);
//   }

// /// One Way Order Trip
// Future<void> oneWayOrderTripCallFromPassengerScreen({
//   required String tripId,
//   required String passengerCounts,
//   required List<Map<String, dynamic>> paramPassengerBody,
//   required List<Map<String, dynamic>> additionalList,
// }) async {
//   try {
//     _loader.showLoader(context: context);
//
//     // Headers
//     Map<String, dynamic> header = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $userToken"
//     };
//
//     _logger.i("trips.id: $tripId");
//     _logger.i("additionalList: ${additionalList.map((e) => e)}");
//     _logger.i("paramPassengerBody: ${paramPassengerBody.map((e) => e)}");
//     _logger.i("hotelRoomBody: ${hotelRoomBody.map((e) => e)}");
//
//     // API->Body
//     final newBody = {
//       "trip_id": tripId,
//       "count": passengerCounts,
//       "code": "",
//       "additional": [],
//       "passengers": paramPassengerBody,
//       "hotel_rooms": [], //hotelRoomBody,
//       "user_notes": ""
//     };
//     _logger.i("newBody: $newBody");
//
//     var url = oneWayOrderTripApiUrl;
//     debugPrint("URL: $url");
//     oneWayOrdersTripResponse = await MyApi.callPostApi(
//       url: url,
//       myHeaders: header,
//       body: newBody,
//       modelName: Models.oneWayOrderTripModel,
//     );
//
//     if (oneWayOrdersTripResponse.code == 1) {
//       _logger.i(
//           "oneWayOrdersTripResponse: ${oneWayOrdersTripResponse.toJson()}, ${oneWayOrdersTripResponse.message.toString()}");
//
//       Toasts.getSuccessToast(
//         text: oneWayOrdersTripResponse.message.toString(),
//       );
//
//       //clear the data lists
//       additionalList.clear();
//       paramPassengerBody.clear();
//       hotelRoomBody.clear();
//
//       isOneWayOrderTripSaved = true;
//       _loader.hideLoader(context!);
//       notifyListeners();
//     } else {
//       _logger.e("oneWayOrdersTripResponse: Something wrong");
//       _loader.hideLoader(context!);
//     }
//   } catch (e) {
//     _logger.e("oneWayOrdersTripResponseError: ${e.toString()}");
//     _loader.hideLoader(context!);
//   }
// }

// // One Way Order Trip
// Future<void> skipHotelOneWayOrderTrip({
//   required String tripId,
//   required String passengerCounts,
//   required List<Map<String, dynamic>> paramPassengerBody,
//   required List<Map<String, dynamic>> additionalList,
// }) async {
//   try {
//     _loader.showLoader(context: context);
//
//     // Headers
//     Map<String, dynamic> header = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $userToken"
//     };
//
//     _logger.i("trips.id: $tripId");
//     _logger.i("additionalList: ${additionalList.map((e) => e)}");
//     _logger.i("paramPassengerBody: ${paramPassengerBody.map((e) => e)}");
//     _logger.i("hotelRoomBody: ${hotelRoomBody.map((e) => e)}");
//
//     // API->Body
//     final newBody = {
//       "trip_id": tripId,
//       "count": passengerCounts,
//       "code": "",
//       "additional": additionalList,
//       "passengers": paramPassengerBody,
//       "hotel_rooms": [], //hotelRoomBody,
//       "user_notes": ""
//     };
//
//     var url = oneWayOrderTripApiUrl;
//     debugPrint("URL: $url");
//     _logger.i("newBody: $newBody");
//     oneWayOrdersTripResponse = await MyApi.callPostApi(
//       url: url,
//       myHeaders: header,
//       body: newBody,
//       modelName: Models.oneWayOrderTripModel,
//     );
//
//     if (oneWayOrdersTripResponse.code == 1) {
//       _logger.i(
//           "oneWayOrdersTripResponse: ${oneWayOrdersTripResponse.toJson()}, ${oneWayOrdersTripResponse.message.toString()}");
//
//       Toasts.getSuccessToast(
//         text: oneWayOrdersTripResponse.message.toString(),
//       );
//
//       //clear the data lists
//       additionalList.clear();
//       paramPassengerBody.clear();
//
//       isOneWayOrderTripSaved = true;
//       _loader.hideLoader(context!);
//       notifyListeners();
//     } else {
//       _logger.e("oneWayOrdersTripResponse: Something wrong");
//       _loader.hideLoader(context!);
//     }
//   } catch (e) {
//     _logger.e("oneWayOrdersTripResponseError: ${e.toString()}");
//     _loader.hideLoader(context!);
//   }
// }
