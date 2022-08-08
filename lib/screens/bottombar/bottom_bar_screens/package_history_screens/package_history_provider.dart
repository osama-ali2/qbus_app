import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/booking_history_model/PackageHistoryResponse.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../local_cache/utils.dart';
import '../../../../network_manager/api_url.dart';
import '../../../../network_manager/models.dart';
import '../../../../res/strings.dart';

class PackageHistoryProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final _loader = Loader();

  bool isPackageHistoryLoaded = false;

  PackageHistoryResponse packageHistoryResponse = PackageHistoryResponse();

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
}
