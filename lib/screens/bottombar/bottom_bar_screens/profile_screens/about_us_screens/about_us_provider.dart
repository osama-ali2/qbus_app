import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/about_us/GetAboutUsResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../../network_manager/models.dart';
import '../../../../../network_manager/my_api.dart';

class AboutUsProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  GetAboutUsResponse getAboutUsResponse = GetAboutUsResponse();

  bool isDataLoaded = false;

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getAboutUsData() async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      debugPrint("URL: $getAboutUsApiUrl");
      getAboutUsResponse = await MyApi.callGetApi(
          url: getAboutUsApiUrl,
          myHeaders: header,
          modelName: Models.aboutUsModel);

      if (getAboutUsResponse.code == 1) {
        _logger.d("getAboutUsResponse: ${getAboutUsResponse.toJson()}");
        _loader.hideLoader(context!);
        isDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("getAboutUsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("getAboutUsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
