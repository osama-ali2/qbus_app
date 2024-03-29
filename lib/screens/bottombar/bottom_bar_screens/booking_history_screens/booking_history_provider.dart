import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/booking_history_model/TripHistoryResponse.dart';
import 'package:qbus/models/rating_models/TripRatingResponse.dart';
import 'package:qbus/widgets/loader.dart';
import 'package:qbus/resources/resources.dart';

import '../../../../local_cache/utils.dart';
import '../../../../network_manager/api_url.dart';
import '../../../../network_manager/models.dart';
import '../../../../network_manager/my_api.dart';

class BookingHistoryProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final _loader = Loader();

  bool isTripHistoryLoaded = false;
  bool isRatingMarked = false;

  TripHistoryResponse tripHistoryResponse = TripHistoryResponse();
  TripRatingResponse tripRatingResponse = TripRatingResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isTripHistoryLoaded = false;
  }

  Future<void> getTripBookingHistoryData({required int offSet}) async {
    try {
      _loader.showLoader(context: context);

      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      Map<String, dynamic> body = {"offset": offSet};

      debugPrint("URL: $tripBookingHistoryApiUrl");
      tripHistoryResponse = await MyApi.callPostApi(
        url: tripBookingHistoryApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.tripBookingHistoryModel,
      );

      if (tripHistoryResponse.code == 1) {
        _logger.d("tripHistoryResponse: ${tripHistoryResponse.toJson()}");
        _loader.hideLoader(context!);
        isTripHistoryLoaded = true;
        notifyListeners();
      } else {
        debugPrint("tripHistoryResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("tripHistoryResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> markTripRating(
      {required int tripId, required int rating}) async {
    try {
      _loader.showLoader(context: context);

      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      Map<String, dynamic> body = {
        "trip_id": tripId,
        "rate": rating,
        "review": "review message"
      };

      debugPrint("URL: $tripRatingReviewApiUrl");
      debugPrint("BODY: $body");
      tripRatingResponse = await MyApi.callPostApi(
        url: tripRatingReviewApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.tripRatingModel,
      );

      if (tripRatingResponse.code == 1) {
        _logger.d("tripRatingResponse: ${tripRatingResponse.toJson()}");
        _loader.hideLoader(context!);
        isRatingMarked = true;
        Toasts.getSuccessToast(text: "${tripRatingResponse.data!.message}");
        notifyListeners();
      } else {
        debugPrint("tripRatingResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("tripRatingResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
