import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/trip_history_model/TripHistoryResponse.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../local_cache/utils.dart';
import '../../../../network_manager/api_url.dart';
import '../../../../network_manager/models.dart';
import '../../../../network_manager/my_api.dart';
import '../../../../res/strings.dart';

class BookingHistoryProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final _loader = Loader();

  bool isTripHistoryLoaded = false;

  TripHistoryResponse tripHistoryResponse = TripHistoryResponse();

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
}
