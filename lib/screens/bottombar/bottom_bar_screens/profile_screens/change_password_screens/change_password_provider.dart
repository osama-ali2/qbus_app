import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/profile/UpdateProfilePasswordResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/network_manager/models.dart';
import 'package:qbus/network_manager/my_api.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/widgets/loader.dart';

class ChangePasswordProvider with ChangeNotifier {
  BuildContext? context;

  final _logger = Logger();
  final _loader = Loader();

  bool isPasswordUpdated = false;

  UpdateProfilePasswordResponse updateProfilePasswordResponse =
      UpdateProfilePasswordResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> updateUserPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      _loader.showLoader(context: context);
      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      final body = {
        "current_password": currentPassword,
        "new_password": newPassword
      };
      _logger.d("body: $body");
      _logger.d("URL: $profileResetPassword");

      updateProfilePasswordResponse = await MyApi.callPostApi(
        url: profileResetPassword,
        myHeaders: header,
        body: body,
        modelName: Models.updateProfilePasswordModel,
      );

      if (updateProfilePasswordResponse.code == 1) {
        _logger.d(
            "updateProfilePasswordResponse: ${updateProfilePasswordResponse.toJson()}");
        Toasts.getSuccessToast(
            text: updateProfilePasswordResponse.data!.message);
        isPasswordUpdated = true;

        _loader.hideLoader(context!);
        notifyListeners();
      } else {
        _logger.e("updateProfilePasswordResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.e("updateProfilePasswordResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
