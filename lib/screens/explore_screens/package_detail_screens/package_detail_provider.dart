import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/packages/PackageDetailResponse.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../network_manager/api_url.dart';
import '../../../network_manager/models.dart';
import '../../../network_manager/my_api.dart';

class PackageDetailProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();
  bool isDataLoaded = false;

  PackageDetailResponse packageDetailResponse = PackageDetailResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getPackagesData({required String id}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};

      var url = "$packagesApiUrl$id";
      debugPrint("URL: $url");

      packageDetailResponse = await MyApi.callGetApi(
          url: url, myHeaders: header, modelName: Models.packagesDetailModel);

      if (packageDetailResponse.code == 1) {
        _logger.d("packageDetailResponse: ${packageDetailResponse.toJson()}");
        _loader.hideLoader(context!);
        isDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("packageDetailResponse: Something wrong");

        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("packageDetailResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
