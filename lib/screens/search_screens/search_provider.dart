import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/widgets/loader.dart';

import '../../models/trips/TripsResponse.dart';
import '../../network_manager/api_url.dart';
import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';

class SearchProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();
  bool isTripDataLoaded = false;
  TripsResponse tripsResponse = TripsResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isTripDataLoaded = false;
  }

  Future<void> getTripsData(
      {required TripFilterModel tripFilterModel, required int offset}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      Map<String, dynamic> body = {
        "code": tripFilterModel.code,
        "date_from": tripFilterModel.date_from,
        "date_to": tripFilterModel.date_to,
        "time_from": tripFilterModel.time_from,
        "from_city_id": tripFilterModel.from_city_id,
        "to_city_id": tripFilterModel.to_city_id,
        "additional": tripFilterModel.additional,
        "offset": offset
      };

      // var body = tripFilterModel.toJson();

      debugPrint("URL: $tripsApiUrl");
      debugPrint("tripsBody: $body");

      tripsResponse = await MyApi.callPostApi(
          url: tripsApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.tripsModel);
      debugPrint("tripsBody: $body");

      if (tripsResponse.code == 1) {
        _logger.d("tripsResponse: ${tripsResponse.toJson()}");
        _loader.hideLoader(context!);

        isTripDataLoaded = true;

        notifyListeners();
      } else {
        debugPrint("tripsResponse: Something wrong");

        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("tripsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> getTripsDataByFilter(
      {required TripFilterModel tripFilterModel}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      // Map<String, dynamic> body = {
      //   "code": "",
      //   "date_from": "",
      //   "date_to": "",
      //   "time_from": "",
      //   "from_city_id": 4,
      //   "to_city_id": 3,
      //   "additional": []
      // };

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
        debugPrint("tripsResponse: Something wrong");

        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("tripsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
