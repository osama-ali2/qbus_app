import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/PackageFilterModel.dart';
import 'package:qbus/widgets/loader.dart';

import '../../models/packages/PackagesResponse.dart';
import '../../network_manager/api_url.dart';
import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';

class ExploreProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();
  bool isDataLoaded = false;
  PackagesResponse packagesResponse = PackagesResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getPackagesData({
    @required String? dateFrom,
    @required String? dateTo,
    @required String? timeFrom,
  }) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "code": "",
        "date_from": dateFrom ?? "",
        "date_to": dateTo ?? "",
        "time_from": timeFrom ?? "",
        "starting_city_id": "",
        "additional": []
      };

      debugPrint("URL: $packagesApiUrl");

      packagesResponse = await MyApi.callPostApi(
          url: packagesApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.packagesModel);
      debugPrint("packageBody: $body");

      if (packagesResponse.code == 1) {
        _logger.d("packagesResponse: ${packagesResponse.toJson()}");
        _loader.hideLoader(context!);

        isDataLoaded = true;

        notifyListeners();
      } else {
        debugPrint("packagesResponse: Something wrong");

        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("packagesResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> getPackageDataByFilters(
      {required PackageFilterModel packageFilterModel}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      // Map<String, dynamic> body = {
      //   "code": "",
      //   "date_from": dateFrom ?? "",
      //   "date_to": dateTo ?? "",
      //   "time_from": timeFrom ?? "",
      //   "starting_city_id": "",
      //   "additional": []
      // };

      var body = packageFilterModel.toJson();

      debugPrint("URL: $packagesApiUrl");

      packagesResponse = await MyApi.callPostApi(
          url: packagesApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.packagesModel);
      debugPrint("packageBody: $body");

      if (packagesResponse.code == 1) {
        _logger.d("packagesResponseByFilter: ${packagesResponse.toJson()}");
        _loader.hideLoader(context!);

        isDataLoaded = true;

        notifyListeners();
      } else {
        debugPrint("packagesResponse: Something wrong");

        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("packagesResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
