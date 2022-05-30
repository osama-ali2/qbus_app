import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

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

// Future<void> navigateToNextScreen() async {
//   await Future.delayed(const Duration(
//     seconds: 3,
//   ));
//
//   if (PreferenceUtils.getString(Strings.loginEmail)!.isNotEmpty &&
//       PreferenceUtils.getString(Strings.loginUserToken)!.isNotEmpty) {
//     _logger.d("loginEmail: ${PreferenceUtils.getString(Strings.loginEmail)}");
//     _logger.d(
//         "loginUserToken: ${PreferenceUtils.getString(Strings.loginUserToken)}");
//     await Navigator.pushReplacement(
//         context!, SlideRightRoute(page: const MainHomeScreen()));
//   } else {
//     await Navigator.pushReplacement(
//         context!, SlideRightRoute(page: const LoginScreen()));
//   }
//   notifyListeners();
// }
}
