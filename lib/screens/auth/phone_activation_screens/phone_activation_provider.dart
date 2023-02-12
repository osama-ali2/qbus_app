import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/auth/GetVerifyPhoneResponse.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/widgets/loader.dart';
import 'package:qbus/network_manager/network_manager.dart';


class PhoneActivationProvider with ChangeNotifier {
  BuildContext? context;

  final _logger = Logger();
  final _loader = Loader();

  bool isDataLoaded = true;
  GetVerifyPhoneResponse getVerifyPhoneResponse = GetVerifyPhoneResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isDataLoaded = false;
  }

  /// Verify Phone Number
  Future<void> verifyPhoneNumber({required dynamic code}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {"code": code};

      _logger.d("URL: $verifyPhoneNumberApiUrl");
      _logger.d("verifyBody: $body");

      getVerifyPhoneResponse = await MyApi.callPostApi(
        url: verifyPhoneNumberApiUrl,
        body: body,
        myHeaders: header,
        modelName: Models.verifyPhoneModel,
      );
      debugPrint("verifyBody: $body");

      if (getVerifyPhoneResponse.code == 1) {
        _loader.hideLoader(context!);
        _logger.d("getVerifyPhoneResponse: ${getVerifyPhoneResponse.toJson()}");
        Toasts.getSuccessToast(text: "${getVerifyPhoneResponse.data!.message}");
        isDataLoaded = true;
        notifyListeners();
      } else {
        _logger.e("getVerifyPhoneResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("getVerifyPhoneResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
