import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../network_manager/api_url.dart';

class PhoneActivationProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

//   Future<void> signUpNewUser({
//     required String userName,
//     required String phoneNumber,
//     required String email,
//     required String address,
//     required String password,
//   }) async {
//     try {
//       _loader.showLoader(context: context);
//
//       Map<String, dynamic> header = {"Content-Type": "application/json"};
//       Map<String, dynamic> body = {"code": "643694"};
//
//       debugPrint("URL: $verifyPhoneNumberApiUrl");
//
//       signUpResponse = await MyApi.callPostApi(
//           url: signUpApiUrl,
//           body: body,
//           myHeaders: header,
//           modelName: Models.signupModel);
//       debugPrint("signUpBody: $body");
//
//       if (signUpResponse.code == 1) {
//         _logger.d("signUpResponse: ${signUpResponse.toJson()}");
//         _loader.hideLoader(context!);
//         isDataLoaded = true;
//         notifyListeners();
//       } else {
//         debugPrint("signUpResponse: Something wrong");
//         _loader.hideLoader(context!);
//       }
//     } catch (e) {
//       debugPrint("signUpResponseError: ${e.toString()}");
//       _loader.hideLoader(context!);
//     }
//   }
}
