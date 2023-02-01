import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/auth/LoginResponse.dart';
import 'package:qbus/push_notification_service/FirebasePushNotificationService.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../local_cache/utils.dart';
import '../../../network_manager/api_url.dart';
import '../../../network_manager/models.dart';
import '../../../network_manager/my_api.dart';
import '../../../res/strings.dart';

class LoginProvider with ChangeNotifier {
  BuildContext? context;
  bool isDataLoaded = false;

  final _logger = Logger();
  final _loader = Loader();

  LoginResponse loginResponse = LoginResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isDataLoaded = false;
  }

  Future<void> loginUser({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {"phone": phoneNumber, "password": password};
      debugPrint("URL: $loginApiUrl");
      _logger.i("loginBody: $body");

      loginResponse = await MyApi.callPostApi(
          url: loginApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.loginModel);
      debugPrint("loginBody: $body");

      if (loginResponse.code == 1) {
        PreferenceUtils.clearPreferences();
        _logger.d("loginResponse: ${loginResponse.toJson()}");

        await FirebasePushNotificationService.initializeNotification(
            userTopic: password);

        await PreferenceUtils.setLoginResponse(loginResponse).then((_) async {
          String name = PreferenceUtils.getString(Strings.loginName) ?? "";
          String loginEmail =
              PreferenceUtils.getString(Strings.loginEmail) ?? "";
          String savedToken =
              PreferenceUtils.getString(Strings.loginUserToken) ?? "";
          String loginWallet =
              PreferenceUtils.getString(Strings.loginWallet) ?? "";

          String loginTopic =
              PreferenceUtils.getString(Strings.loginTopic) ?? "";

          _logger.i(
              "savedToken: $savedToken, Topic: $loginTopic, name: $name, loginEmail $loginEmail, loginWallet: $loginWallet");
          _loader.hideLoader(context!);
          isDataLoaded = true;

          notifyListeners();
        }).onError((error, stackTrace) {
          _logger.e("Save Error: ${error.toString()}");
          _loader.hideLoader(context!);
        });
      } else {
        debugPrint("loginResponse: Something wrong");

        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("loginResponseError: ${e.toString()}");
      _logger.e("loginResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
