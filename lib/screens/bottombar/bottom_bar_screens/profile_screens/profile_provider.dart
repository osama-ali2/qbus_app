import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/auth/LogoutResponse.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../network_manager/api_url.dart';
import '../../../../network_manager/models.dart';
import '../../../../network_manager/my_api.dart';

class ProfileProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  LogoutResponse logoutResponse = LogoutResponse();
  bool isUserLogout = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isUserLogout = false;
  }

  Future<void> logoutUser() async {
    try {
      _loader.showLoader(context: context);

      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      debugPrint("URL: $logoutApiUrl");
      logoutResponse = await MyApi.callGetApi(
          url: logoutApiUrl, myHeaders: header, modelName: Models.logoutModel);

      if (logoutResponse.code == 1) {
        _logger.d("logoutResponse: ${logoutResponse.toJson()}");
        _loader.hideLoader(context!);
        Toasts.getSuccessToast(text: "Logout");
        isUserLogout = true;
        notifyListeners();
      } else {
        debugPrint("logoutResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("logoutResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
