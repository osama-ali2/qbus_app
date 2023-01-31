import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/auth/ForgotPasswordResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../network_manager/models.dart';
import '../../../network_manager/my_api.dart';

class ForgotProvider with ChangeNotifier {
  BuildContext? context;

  final Logger _logger = Logger();
  final Loader _loader = Loader();

  ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse();
  bool isSuccessful = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isSuccessful = false;
  }

  Future<void> forgetPasswordUser({
    required String password,
    required String code,
  }) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {"code": code, "password": password};

      debugPrint("URL: $resetPasswordApiUrl");

      forgotPasswordResponse = await MyApi.callPostApi(
          url: resetPasswordApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.forgotPasswordModel);
      debugPrint("body: $body");

      if (forgotPasswordResponse.code == 1) {
        _logger.d("forgotPasswordResponse: ${forgotPasswordResponse.toJson()}");
        _loader.hideLoader(context!);
        isSuccessful = true;
        Toasts.getSuccessToast(text: forgotPasswordResponse.message.toString());
        notifyListeners();
      } else {
        debugPrint("forgotPasswordResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("forgotPasswordResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
