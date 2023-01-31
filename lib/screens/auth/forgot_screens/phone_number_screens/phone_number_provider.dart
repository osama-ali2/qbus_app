import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/auth/ForgotPasswordResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/widgets/loader.dart';

class PhoneNumberProvider with ChangeNotifier {
  BuildContext? context;

  final _logger = Logger();
  final _loader = Loader();

  ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse();
  bool isSuccessful = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isSuccessful = false;
  }

  /// Forget Password User
  Future<void> forgetPasswordUser({
    required String phoneNumber,
  }) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "phone": phoneNumber,
      };

      debugPrint("URL: $forgetPasswordApiUrl");

      forgotPasswordResponse = await MyApi.callPostApi(
        url: forgetPasswordApiUrl,
        body: body,
        myHeaders: header,
        modelName: Models.forgotPasswordModel,
      );
      debugPrint("body: $body");

      if (forgotPasswordResponse.code == 1) {
        Toasts.getSuccessToast(text: forgotPasswordResponse.message.toString());
        _logger.d("forgotPasswordResponse: ${forgotPasswordResponse.toJson()}");
        _loader.hideLoader(context!);
        isSuccessful = true;
        notifyListeners();
      } else {
        _logger.e("forgotPasswordResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("forgotPasswordResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
