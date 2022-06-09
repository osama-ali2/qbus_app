import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/auth/LoginResponse.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../network_manager/api_url.dart';
import '../../../network_manager/models.dart';
import '../../../network_manager/my_api.dart';

class LoginProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  LoginResponse loginResponse = LoginResponse();

  bool isDataLoaded = false;

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

      loginResponse = await MyApi.callPostApi(
          url: loginApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.loginModel);
      debugPrint("loginBody: $body");

      if (loginResponse.code == 1) {
        _logger.d("loginResponse: ${loginResponse.toJson()}");
        _loader.hideLoader(context!);
        isDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("loginResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("loginResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
