import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/privacy_policy/ReturnPolicyResponse.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../../network_manager/api_url.dart';
import '../../../../../network_manager/models.dart';
import '../../../../../network_manager/my_api.dart';

class ReturnPolicyProvider with ChangeNotifier {
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  ReturnPolicyResponse returnPolicyResponse = ReturnPolicyResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getPrivacyPolicy() async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };

      debugPrint("URL: $getReturnPolicyApiUrl");
      returnPolicyResponse = await MyApi.callGetApi(
          url: getReturnPolicyApiUrl,
          myHeaders: header,
          modelName: Models.returnPolicyModel);

      if (returnPolicyResponse.code == 1) {
        _logger.d("returnPolicyResponse: ${returnPolicyResponse.toJson()}");
        _loader.hideLoader(context!);
        // isProfileLoading = true;
        notifyListeners();
      } else {
        debugPrint("returnPolicyResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("returnPolicyResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
