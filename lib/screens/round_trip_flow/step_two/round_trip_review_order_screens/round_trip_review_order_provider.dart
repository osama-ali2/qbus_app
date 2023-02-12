// Created by Tayyab Mughal on 14/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/order_reviews/RoundOrderReviewResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/widgets/loader.dart';

class RoundTripReviewOrderProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  bool isRoundOrderReviewLoaded = false;
  RoundOrderReviewResponse roundOrderReviewResponse =
      RoundOrderReviewResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  // Round Order Review
  Future<void> roundOrderReview({
    required List<int> tripId,
  }) async {
    try {
      _loader.showLoader(context: context);

      // Headers
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };
      var url = roundWayOrderApiUrl;
      final body = {"orders_id": tripId};

      debugPrint("URL: $url");
      _logger.i("newBody: $body");

      roundOrderReviewResponse = await MyApi.callPostApi(
        url: url,
        myHeaders: header,
        body: body,
        modelName: Models.roundOrderReviewModel,
      );

      if (roundOrderReviewResponse.code == 1) {
        _logger.d(
            "roundOrderReviewResponse: ${roundOrderReviewResponse.toJson()}, ${roundOrderReviewResponse.message.toString()}");

        Toasts.getSuccessToast(
          text: roundOrderReviewResponse.message.toString(),
        );

        isRoundOrderReviewLoaded = true;
        _loader.hideLoader(context!);
        notifyListeners();
      } else {
        _logger.e("roundOrderReviewResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("roundOrderReviewResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
