import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/additionals/TripAdditionalsResponse.dart';
import 'package:qbus/models/error_model/ErrorResponse.dart';
import 'package:qbus/models/trips/MultiOrdersTripResponse.dart';
import 'package:qbus/models/trips/OneWayOrdersTripResponse.dart';
import 'package:qbus/models/trips/RoundOrdersTripResponse.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';

import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';
import '../../res/strings.dart';

class SelectAdditionProvider with ChangeNotifier {
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
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
  List<Map<String, dynamic>> additionalList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isOneWayOrderTripSaved = false;
    isRoundOrderTripSaved = false;
    isMultiOrderTripSaved = false;
    isTripLoaded = false;
  }

  /// Get Additional Data
  Future<void> getAdditionalData({required String id}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      var url = "$tripAdditionalApiUrl$id";
      debugPrint("URL: $url");

      tripAdditionalsResponse = await MyApi.callGetApi(
          url: url, myHeaders: header, modelName: Models.tripAdditionalsModel);
      if (tripAdditionalsResponse.code == 1) {
        _logger
            .d("tripAdditionalsResponse: ${tripAdditionalsResponse.toJson()}");

        var length = tripAdditionalsResponse.data!.additional!.length;
        for (int i = 0; i < length; i++) {
          Map<String, dynamic> demoData = {
            "id": 0,
            "counter": 0,
          };
          additionalList.add(demoData);
          selectAdditionalList.add(0);
          debugPrint("selectAdditionalList: ${selectAdditionalList.length}");
        }
        isTripLoaded = true;
        _loader.hideLoader(context!);
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

  /// One Way Order Trip
  Future<void> oneWayOrderTrip(
      {required Trips trips, required String passengersCount}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      debugPrint("trips.id: ${trips.id}");

      debugPrint("additionalList: ${additionalList.map((e) => e)}");

      Map<String, dynamic> body = {
        "trip_id": trips.id,
        "count": passengersCount,
        "code": "",
        "additional": additionalList,
        "user_notes": ""
      };

      var url = oneWayOrderTripApiUrl;
      debugPrint("URL: $url");
      // debugPrint("Header: $header");
      debugPrint("Body: $body");

      oneWayOrdersTripResponse = await MyApi.callPostApi(
          url: url,
          myHeaders: header,
          body: body,
          modelName: Models.oneWayOrderTripModel);
      debugPrint("Body: $body");

      if (oneWayOrdersTripResponse.code == 1) {
        _logger.d(
            "oneWayOrdersTripResponse: ${oneWayOrdersTripResponse.toJson()}, ${oneWayOrdersTripResponse.message.toString()}");
        _loader.hideLoader(context!);
        isOneWayOrderTripSaved = true;
        additionalList.clear();
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

  /// Round Order Trip
  Future<void> roundOrderTrip(
      {required Trips trips, required String passengersCount}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      Map<String, dynamic> tripBody = {
        "trip_id": trips.id,
        "count": passengersCount,
        "code": "",
        "additional": additionalList,
        "user_notes": ""
      };

      Map<String, dynamic> body = {
        "trips": [tripBody]
      };

      var url = roundOrderTripApiUrl;

      debugPrint("URL: $url");
      debugPrint("Header: $header");
      debugPrint("Body: $body");

      roundOrderTripResponse = await MyApi.callPostApi(
          url: url,
          myHeaders: header,
          body: body,
          modelName: Models.roundOrderTripModel);
      debugPrint("Body: $body");

      if (roundOrderTripResponse.code == 1) {
        _logger.d(
            "roundOrderTripResponse: ${roundOrderTripResponse.toJson()}, ${roundOrderTripResponse.toString()}");
        _loader.hideLoader(context!);
        isRoundOrderTripSaved = true;
        additionalList.clear();
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

  /// Multi-Order Trip
  Future<void> multiOrderTrip(
      {required Trips trips, required String passengersCount}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      Map<String, dynamic> tripBody = {
        "trip_id": trips.id,
        "count": passengersCount,
        "code": "",
        "additional": additionalList,
        "user_notes": ""
      };

      Map<String, dynamic> body = {
        "trips": [tripBody]
      };

      var url = multiOrderTripApiUrl;

      debugPrint("URL: $url");
      // debugPrint("Header: $header");
      debugPrint("Body: $body");

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
