import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/contact_us/GetContactUsResponse.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../network_manager/api_url.dart';
import '../../../../network_manager/models.dart';
import '../../../../network_manager/my_api.dart';

class ContactUsProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  bool isDataSubmitted = false;
  GetContactUsResponse getContactUsResponse = GetContactUsResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isDataSubmitted = false;
  }

  Future<void> contactUsSubmit({
    required String name,
    required String email,
    required String phoneNumber,
    required String subject,
    required String message,
  }) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "name": name,
        "email": email,
        "subject": subject,
        "phone": phoneNumber,
        "message": message
      };

      debugPrint("URL: $contactUsApiUrl");
      debugPrint("contactUsBody: $body");
      getContactUsResponse = await MyApi.callPostApi(
          url: contactUsApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.contactUsModel);

      if (getContactUsResponse.code == 1) {
        _logger.d("contactUsResponse: ${getContactUsResponse.toJson()}");
        _loader.hideLoader(context!);
        isDataSubmitted = true;
        notifyListeners();
      } else {
        debugPrint("contactUsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      _logger.d("contactUsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
