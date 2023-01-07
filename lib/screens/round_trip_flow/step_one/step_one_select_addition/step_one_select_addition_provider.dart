import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/additionals/TripAdditionalsResponse.dart';
import 'package:qbus/models/error_model/ErrorResponse.dart';
import 'package:qbus/models/trips/RoundOrdersTripResponse.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/widgets/loader.dart';

class StepOneSelectAdditionProvider with ChangeNotifier {
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  bool isTripLoaded = false;
  bool isRoundOrderTripSaved = false;

  TripAdditionalsResponse tripAdditionalsResponse = TripAdditionalsResponse();
  RoundOrdersTripResponse roundOrderTripResponse = RoundOrdersTripResponse();
  ErrorResponse errorResponse = ErrorResponse();

  List<int> selectAdditionalList = [];
  List<Map<String, dynamic>> additionalList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isRoundOrderTripSaved = false;
  }

  Future<void> getAdditionalData({required String id}) async {
    try {
      // selectAdditionalList.clear();

      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      var url = "$tripAdditionalApiUrl$id";
      debugPrint("URL: $url");
      tripAdditionalsResponse = await MyApi.callGetApi(
          url: url, myHeaders: header, modelName: Models.tripAdditionalsModel);

      if (tripAdditionalsResponse.code == 1) {
        _logger.d(
            "tripAdditionalsResponse: ${tripAdditionalsResponse.data!.toJson()}");
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
        _loader.hideLoader(context!);
        isTripLoaded = true;
        notifyListeners();
      } else {
        debugPrint("tripAdditionalsResponse: Something wrong");
        _logger.i("tripAdditionalsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("tripAdditionalsResponseError: ${e.toString()}");
      _logger.i("tripAdditionalsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

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
        _logger.e("roundOrderTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("roundOrderTripResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
