import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../../local_cache/utils.dart';
import '../../../../../models/auth/UserResponse.dart';
import '../../../../../network_manager/api_url.dart';
import '../../../../../network_manager/models.dart';
import '../../../../../network_manager/my_api.dart';
import '../../../../../res/strings.dart';

class WalletProvider with ChangeNotifier {
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  UserResponse userResponse = UserResponse();
  bool isProfileLoading = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isProfileLoading = false;
  }

  Future<void> getUserProfile() async {
    try {
      _loader.showLoader(context: context);

      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      debugPrint("URL: $getUserInfoApiUrl");
      userResponse = await MyApi.callGetApi(
          url: getUserInfoApiUrl,
          myHeaders: header,
          modelName: Models.userProfileModel);

      if (userResponse.code == 1) {
        _logger.d("userResponse: ${userResponse.toJson()}");
        _loader.hideLoader(context!);
        isProfileLoading = true;
        notifyListeners();
      } else {
        debugPrint("userResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("userResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
