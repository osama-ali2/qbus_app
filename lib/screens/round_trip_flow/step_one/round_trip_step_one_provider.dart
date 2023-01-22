import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/widgets/loader.dart';

class RoundTripStepOneProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  bool isTripDataLoaded = false;
  TripsResponse tripsResponse = TripsResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isTripDataLoaded = false;
  }

  /// Get Trips Data
  Future<void> getTripsData(
      {required TripFilterModel tripFilterModel, required int offset}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "code": tripFilterModel.code,
        "date_from": tripFilterModel.date_from,
        "date_to": "", //tripFilterModel.date_to,
        "time_from": tripFilterModel.time_from,
        "from_city_id": tripFilterModel.from_city_id,
        "to_city_id": tripFilterModel.to_city_id,
        "additional": tripFilterModel.additional,
        "offset": offset
      };

      debugPrint("URL: $tripsApiUrl");
      debugPrint("tripsBody: $body");

      tripsResponse = await MyApi.callPostApi(
          url: tripsApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.tripsModel);

      if (tripsResponse.code == 1) {
        _logger.i("tripsResponse: ${tripsResponse.toJson()}");
        _loader.hideLoader(context!);
        isTripDataLoaded = true;
        notifyListeners();
      } else {
        _logger.e("tripsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("tripsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  /// Get Trips Data by Filter
  Future<void> getTripsDataByFilter(
      {required TripFilterModel tripFilterModel}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      var body = tripFilterModel.toJson();
      debugPrint("URL: $tripsApiUrl");

      tripsResponse = await MyApi.callPostApi(
          url: tripsApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.tripsModel);
      debugPrint("tripsBody: $body");

      if (tripsResponse.code == 1) {
        _logger.d("tripsResponseByFilter: ${tripsResponse.toJson()}");
        _loader.hideLoader(context!);
        isTripDataLoaded = true;
        notifyListeners();
      } else {
        _logger.e("tripsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("tripsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
