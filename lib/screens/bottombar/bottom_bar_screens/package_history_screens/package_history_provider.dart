import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/booking_history_model/PackageHistoryResponse.dart';
import 'package:qbus/models/rating_models/PackageRatingResponse.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../local_cache/utils.dart';
import '../../../../network_manager/api_url.dart';
import '../../../../network_manager/models.dart';
import 'package:qbus/resources/resources.dart';


class PackageHistoryProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final _loader = Loader();

  bool isPackageHistoryLoaded = false;
  bool isRatingMarked = false;

  PackageHistoryResponse packageHistoryResponse = PackageHistoryResponse();
  PackageRatingResponse packageRatingResponse = PackageRatingResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getPackageBookingHistoryData({required int offSet}) async {
    try {
      _loader.showLoader(context: context);

      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      Map<String, dynamic> body = {"offset": offSet};

      debugPrint("URL: $packageBookingHistoryApiUrl");
      packageHistoryResponse = await MyApi.callPostApi(
        url: packageBookingHistoryApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.packageBookingHistoryModel,
      );

      if (packageHistoryResponse.code == 1) {
        _logger.d("packageHistoryResponse: ${packageHistoryResponse.toJson()}");
        _loader.hideLoader(context!);
        isPackageHistoryLoaded = true;
        notifyListeners();
      } else {
        debugPrint("packageHistoryResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("packageHistoryResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> markPackageRating(
      {required int packageId, required int rating}) async {
    try {
      _loader.showLoader(context: context);

      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      Map<String, dynamic> body = {
        "package_id": 1,
        "rate": rating,
        "review": "review message"
      };

      debugPrint("URL: $packageRatingReviewApiUrl");
      debugPrint("BODY: $body");
      packageRatingResponse = await MyApi.callPostApi(
        url: packageRatingReviewApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.packageRatingModel,
      );

      if (packageRatingResponse.code == 1) {
        _logger.d("packageRatingResponse: ${packageRatingResponse.toJson()}");
        _loader.hideLoader(context!);
        isRatingMarked = true;
        Toasts.getSuccessToast(text: "${packageRatingResponse.data!.message}");
        notifyListeners();
      } else {
        debugPrint("packageRatingResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("packageRatingResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
