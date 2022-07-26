import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/additionals/TripAdditionalsResponse.dart';
import 'package:qbus/models/error_model/ErrorResponse.dart';
import 'package:qbus/models/trips/MultiOrdersTripResponse.dart';
import 'package:qbus/models/trips/OneWayOrdersTripResponse.dart';
import 'package:qbus/models/trips/RoundOrdersTripResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';
import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';

class SelectAdditionProvider with ChangeNotifier {
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  bool isTripLoaded = false;

  bool isOneWayOrderTripSaved = false;
  bool isRoundOrderTripSaved = false;
  bool isMultiOrderTripSaved = false;

  TripAdditionalsResponse tripAdditionalsResponse = TripAdditionalsResponse();

  RoundOrdersTripResponse roundOrderTripResponse = RoundOrdersTripResponse();
  MultiOrdersTripResponse multiOrdersTripResponse = MultiOrdersTripResponse();
  OneWayOrdersTripResponse oneWayOrdersTripResponse =
      OneWayOrdersTripResponse();

  ErrorResponse errorResponse = ErrorResponse();

  List<int> selectAdditionalList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isOneWayOrderTripSaved = false;
    isRoundOrderTripSaved = false;
    isMultiOrderTripSaved = false;
  }

  Future<void> getAdditionalData({required String id}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      var url = "$tripAdditionalApiUrl$id";

      debugPrint("URL: $url");

      tripAdditionalsResponse = await MyApi.callGetApi(
          url: url, myHeaders: header, modelName: Models.tripAdditionalsModel);
      // debugPrint("aBody: $body");

      if (tripAdditionalsResponse.code == 1) {
        _logger
            .d("tripAdditionalsResponse: ${tripAdditionalsResponse.toJson()}");

        var length = tripAdditionalsResponse.data!.additional!.length;
        for (int i = 0; i < length; i++) {
          selectAdditionalList.add(0);
          debugPrint("selectAdditionalList: ${selectAdditionalList.length}");
        }
        _loader.hideLoader(context!);
        isTripLoaded = true;
        notifyListeners();
      } else {
        debugPrint("tripAdditionalsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("tripAdditionalsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> oneWayOrderTrip() async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      final body = {
        "trip_id": "34",
        "count": "3",
        "code": "SALE10",
        "additional": ["2", "3"],
        "additional_count": {"2": "4", "3": "2"},
        "user_notes": ""
      };

      var url = oneWayOrderTripApiUrl;
      debugPrint("URL: $url");

      // Dio dio = Dio();
      //
      // Response response = await dio.post(
      //   url,
      //   options: Options(
      //     headers: header,
      //   ),
      //   data: body,
      // );
      //
      // if (response.statusCode == 200) {
      //
      //   dynamic decode = JsonDecoder(response.data);
      //   _logger.d("Response: ${response.data}");
      // } else {
      //   _logger.d("ResponseStatus: ${response.statusCode}, ${response.data}");
      // }

      oneWayOrdersTripResponse = await MyApi.callPostApi(
          url: url,
          myHeaders: header,
          body: body,
          modelName: Models.oneWayOrderTripModel);
      debugPrint("Body: $body");

      if (errorResponse.code == 1) {
        _logger.d(
            "oneWayOrdersTripResponse: ${oneWayOrdersTripResponse.toJson()}, ${oneWayOrdersTripResponse.data!.message.toString()}");
        _loader.hideLoader(context!);
        isOneWayOrderTripSaved = true;
        notifyListeners();
      } else {
        debugPrint("oneWayOrdersTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.d("oneWayOrdersTripResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> roundOrderTrip() async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      final body = {
        "trips": [
          {
            "trip_id": "34",
            "count": "3",
            "code": "SALE20",
            "additional": ["2", "3"],
            "additional_count": {"2": "4", "3": "2"},
            "user_notes": ""
          },
          {
            "trip_id": "34",
            "count": "3",
            "code": "SALE20",
            "additional": ["2", "3"],
            "additional_count": {"2": "4", "3": "2"},
            "user_notes": ""
          }
        ]
      };

      var url = roundOrderTripApiUrl;

      debugPrint("URL: $url");
      roundOrderTripResponse = await MyApi.callPostApi(
          url: url,
          myHeaders: header,
          body: body,
          modelName: Models.roundOrderTripModel);
      debugPrint("Body: $body");

      if (roundOrderTripResponse.code == 1) {
        _logger.d(
            "roundOrderTripResponse: ${roundOrderTripResponse.toJson()}, ${roundOrderTripResponse.data!.message.toString()}");
        _loader.hideLoader(context!);
        isRoundOrderTripSaved = true;
        notifyListeners();
      } else {
        debugPrint("roundOrderTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.d("roundOrderTripResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> multiOrderTrip() async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      final body = {
        "trips": [
          {
            "trip_id": "34",
            "count": "3",
            "code": "SALE20",
            "additional": ["2", "3"],
            "additional_count": [
              {"2": "4"},
              {"3": "2"}
            ],
            "user_notes": ""
          },
          {
            "trip_id": "34",
            "count": "3",
            "code": "SALE20",
            "additional": ["2", "3"],
            "additional_count": {"2": "4", "3": "2"},
            "user_notes": ""
          }
        ]
      };

      var url = multiOrderTripApiUrl;

      debugPrint("URL: $url");
      multiOrdersTripResponse = await MyApi.callPostApi(
          url: url,
          myHeaders: header,
          body: body,
          modelName: Models.multiOrderTripModel);
      debugPrint("Body: $body");

      if (multiOrdersTripResponse.code == 1) {
        _logger.d(
            "multiOrdersTripResponse: ${multiOrdersTripResponse.toJson()}, ${multiOrdersTripResponse.data!.message.toString()}");
        _loader.hideLoader(context!);
        isMultiOrderTripSaved = true;
        notifyListeners();
      } else {
        debugPrint("multiOrdersTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.d("multiOrdersTripResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
