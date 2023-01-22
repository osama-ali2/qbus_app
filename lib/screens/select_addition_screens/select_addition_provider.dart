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
            .i("tripAdditionalsResponse: ${tripAdditionalsResponse.toJson()}");

        var length = tripAdditionalsResponse.data!.additional!.length;
        for (int i = 0; i < length; i++) {
          Map<String, dynamic> demoData = {
            "id": 0,
            "counter": 0,
          };
          additionalList.add(demoData);
          selectAdditionalList.add(0);
          _logger.i("selectAdditionalList: ${selectAdditionalList.length}");
        }
        isTripLoaded = true;
        _loader.hideLoader(context!);
        notifyListeners();
      } else {
        _logger.e("tripAdditionalsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("tripAdditionalsResponseError: ${e.toString()}");
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

      debugPrint(
          "trips.id: ${trips.id} \n additionalList: ${additionalList.map((e) => e)}");

      Map<String, dynamic> body = {
        "trip_id": trips.id,
        "count": passengersCount,
        "code": "",
        "additional": additionalList,
        "user_notes": ""
      };

      var url = oneWayOrderTripApiUrl;
      debugPrint("URL: $url\n Body: $body");

      oneWayOrdersTripResponse = await MyApi.callPostApi(
          url: url,
          myHeaders: header,
          body: body,
          modelName: Models.oneWayOrderTripModel);
      debugPrint("Body: $body");

      if (oneWayOrdersTripResponse.code == 1) {
        _logger.i(
            "oneWayOrdersTripResponse: ${oneWayOrdersTripResponse.toJson()}, ${oneWayOrdersTripResponse.message.toString()}");
        _loader.hideLoader(context!);
        isOneWayOrderTripSaved = true;
        additionalList.clear();
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
