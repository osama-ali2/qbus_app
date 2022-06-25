import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/privacy_policy/PrivacyPolicyResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../../network_manager/models.dart';
import '../../../../../network_manager/my_api.dart';

class PrivacyPolicyProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  PrivacyPolicyResponse privacyPolicyResponse = PrivacyPolicyResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getPrivacyPolicy() async {
    try {

      _loader.showLoader(context: context);
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };

      debugPrint("URL: $getPrivacyPolicyApiUrl");
      privacyPolicyResponse = await MyApi.callGetApi(
          url: getPrivacyPolicyApiUrl,
          myHeaders: header,
          modelName: Models.privacyPolicyModel);

      if (privacyPolicyResponse.code == 1) {
        _logger.d("privacyPolicyResponse: ${privacyPolicyResponse.toJson()}");
        _loader.hideLoader(context!);
        // isProfileLoading = true;
        notifyListeners();
      } else {
        debugPrint("privacyPolicyResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("privacyPolicyResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
