import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/auth/GetVerifyPhoneResponse.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../network_manager/api_url.dart';
import '../../../network_manager/models.dart';
import '../../../network_manager/my_api.dart';

class PhoneActivationProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  bool isDataLoaded = true;

  GetVerifyPhoneResponse getVerifyPhoneResponse = GetVerifyPhoneResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isDataLoaded = false;
  }

  Future<void> verifyPhoneNumber({required dynamic code}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {"code": code};

      debugPrint("URL: $verifyPhoneNumberApiUrl");
      debugPrint("verifyBody: $body");

      getVerifyPhoneResponse = await MyApi.callPostApi(
          url: verifyPhoneNumberApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.verifyPhoneModel);
      debugPrint("verifyBody: $body");

      if (getVerifyPhoneResponse.code == 1) {
        _logger.d("getVerifyPhoneResponse: ${getVerifyPhoneResponse.toJson()}");
        _loader.hideLoader(context!);
        isDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("getVerifyPhoneResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("getVerifyPhoneResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
