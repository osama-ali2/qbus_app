import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/additionals/PackageAdditionalsResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../network_manager/models.dart';
import '../../../network_manager/my_api.dart';

class PackageSelectAdditionProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  bool isPackageLoaded = false;

  PackageAdditionalsResponse packageAdditionalsResponse =
      PackageAdditionalsResponse();

  List<int> packageSelectAdditionalList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getAdditionalData({required String id}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      var url = "$packageAdditionalApiUrl$id";
      debugPrint("URL: $url");
      packageAdditionalsResponse = await MyApi.callGetApi(
          url: url,
          myHeaders: header,
          modelName: Models.packageAdditionalsModel);
      // debugPrint("aBody: $body");

      if (packageAdditionalsResponse.code == 1) {
        _logger.d(
            "packageAdditionalsResponse: ${packageAdditionalsResponse.toJson()}");

        var length = packageAdditionalsResponse.data!.additional!.length;
        for (int i = 0; i < length; i++) {
          packageSelectAdditionalList.add(0);
          debugPrint(
              "packageSelectAdditionalList: ${packageSelectAdditionalList.length}");
        }

        _loader.hideLoader(context!);
        isPackageLoaded = true;
        notifyListeners();
      } else {
        debugPrint("packageAdditionalsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("packageAdditionalsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
