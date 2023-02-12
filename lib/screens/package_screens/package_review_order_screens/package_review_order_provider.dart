// Created by Tayyab Mughal on 14/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/order_reviews/OneWayOrderReviewResponse.dart';
import 'package:qbus/models/order_reviews/PackageOrderReviewResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/widgets/loader.dart';
import 'package:qbus/resources/resources.dart';

class PackageReviewOrderProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  bool isOrderReviewLoaded = false;

  PackageOrderReviewResponse packageOrderReviewResponse =
      PackageOrderReviewResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  /// orderReview
  Future<void> packageOrderReview({
    required int packageId,
  }) async {
    try {
      _loader.showLoader(context: context);

      // Headers
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      final body = {"orders_id": packageId};
      var url = packageOrderReviewApiUrl;
      debugPrint("URL: $url");
      _logger.i("newBody: $body");

      packageOrderReviewResponse = await MyApi.callPostApi(
        url: url,
        myHeaders: header,
        body: body,
        modelName: Models.packageOrderReviewModel,
      );

      if (packageOrderReviewResponse.code == 1) {
        _logger.i(
            "oneWayOrderReviewResponse: ${packageOrderReviewResponse.toJson()}, ${packageOrderReviewResponse.message.toString()}");

        Toasts.getSuccessToast(
          text: packageOrderReviewResponse.message.toString(),
        );

        isOrderReviewLoaded = true;
        _loader.hideLoader(context!);
        notifyListeners();
      } else {
        _logger.e("packageOrderReviewResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("packageOrderReviewResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
