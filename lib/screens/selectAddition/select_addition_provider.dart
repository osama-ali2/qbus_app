import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/additionals/TripAdditionalsResponse.dart';
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
  TripAdditionalsResponse tripAdditionalsResponse = TripAdditionalsResponse();
  RoundOrdersTripResponse roundOrderTripResponse = RoundOrdersTripResponse();
  List<int> selectAdditionalList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isOneWayOrderTripSaved = false;
    isRoundOrderTripSaved = false;
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
      // debugPrint("aBody: $body");

      if (roundOrderTripResponse.code == 1) {
        _logger.d("roundOrderTripResponse: ${roundOrderTripResponse.toJson()}");
        _loader.hideLoader(context!);
        isRoundOrderTripSaved = true;
        notifyListeners();
      } else {
        debugPrint("roundOrderTripResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.d("roundOrderTripResponseError: ${e.toString()}");
    }
  }
}
