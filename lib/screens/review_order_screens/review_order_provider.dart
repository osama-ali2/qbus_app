// Created by Tayyab Mughal on 14/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/trips/OneWayOrderReviewResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/widgets/loader.dart';
import '../../res/toasts.dart';

class ReviewOrderProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  OneWayOrderReviewResponse oneWayOrderReviewResponse =
      OneWayOrderReviewResponse();

  bool isOrderReviewLoaded = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  // orderReview
  Future<void> orderReview({
    required int tripId,
  }) async {
    try {
      _loader.showLoader(context: context);

      // Headers
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      final body = {"orders_id": tripId};

      // var url = ordersReviewApiUrl;
      var url = oneWayOrderOrderApiUrl;
      debugPrint("URL: $url");
      _logger.d("newBody: $body");
      oneWayOrderReviewResponse = await MyApi.callPostApi(
        url: url,
        myHeaders: header,
        body: body,
        modelName: Models.oneWayOrderReviewModel, //Models.ordersReviewModel,
      );

      if (oneWayOrderReviewResponse.code == 1) {
        _logger.d(
            "oneWayOrderReviewResponse: ${oneWayOrderReviewResponse.toJson()}, ${oneWayOrderReviewResponse.message.toString()}");

        Toasts.getSuccessToast(
          text: oneWayOrderReviewResponse.message.toString(),
        );

        isOrderReviewLoaded = true;
        _loader.hideLoader(context!);
        notifyListeners();
      } else {
        _logger.e("oneWayOrderReviewResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("oneWayOrderReviewResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
