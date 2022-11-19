import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screen.dart';

import '../../local_cache/utils.dart';
import '../../res/strings.dart';

class SplashProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();

  Future<void> init({@required BuildContext? context}) async {
    PreferenceUtils.init();
    this.context = context;
    // await navigateToNextScreen();
  }

  Future<void> navigateToNextScreen({required BuildContext context}) async {
    await Future.delayed(const Duration(
      seconds: 3,
    ));
    if (PreferenceUtils.getString(Strings.loginEmail)!.isNotEmpty &&
        PreferenceUtils.getString(Strings.loginUserToken)!.isNotEmpty) {
      _logger.d("loginEmail: ${PreferenceUtils.getString(Strings.loginEmail)}");
      _logger.d(
          "loginUserToken: ${PreferenceUtils.getString(Strings.loginUserToken)}");

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomBarScreen()),
          (route) => false);
    } else {
      //Changed: Get Start Screen To Login Screen
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
    notifyListeners();
  }
}
