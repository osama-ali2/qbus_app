import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/auth/SignUpResponse.dart';
import 'package:qbus/models/cities/GetCitiesResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../network_manager/models.dart';
import '../../../network_manager/my_api.dart';

class SignUpProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  SignUpResponse signUpResponse = SignUpResponse();
  GetCitiesResponse getCitiesResponse = GetCitiesResponse();
  bool isDataLoaded = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> signUpNewUser({
    required String userName,
    required String phoneNumber,
    required String email,
    required String address,
    required String password,
    required String status,
  }) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "name": userName,
        "phone": phoneNumber,
        "email": email,
        "address": address,
        "date_of_birth": "30-05-2000",
        "city_id": "2",
        "marital_status": "married",
        "password": password
      };

      debugPrint("URL: $signUpApiUrl");

      signUpResponse = await MyApi.callPostApi(
          url: signUpApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.signupModel);
      debugPrint("signUpBody: $body");

      if (signUpResponse.code == 1) {
        _logger.d("signUpResponse: ${signUpResponse.toJson()}");
        _loader.hideLoader(context!);
        isDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("signUpResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("signUpResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> getCitiesData() async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};

      debugPrint("URL: $getCitiesApiUrl");
      getCitiesResponse = await MyApi.callGetApi(
          url: getCitiesApiUrl,
          myHeaders: header,
          modelName: Models.citiesModel);

      if (getCitiesResponse.code == 1) {
        _logger.d("getCitiesResponse: ${getCitiesResponse.toJson()}");
        _loader.hideLoader(context!);
        isDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("getCitiesResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("getCitiesResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
