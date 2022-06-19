import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/additional/GetAdditionalResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';

import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';

class SelectAdditionProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  bool isDataLoaded = false;

  GetAdditionalResponse getAdditionalResponse = GetAdditionalResponse();

  List<int> selectAdditionalList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getAdditionalData() async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      // Map<String, dynamic> body = {
      //   "code": "",
      //   "date_from": "",
      //   "date_to": "",
      //   "time_from": "",
      //   "starting_city_id": "",
      //   "additional": []
      // };

      debugPrint("URL: $getAdditionalApiUrl");
      getAdditionalResponse = await MyApi.callGetApi(
          url: getAdditionalApiUrl,
          myHeaders: header,
          modelName: Models.additionalModel);
      // debugPrint("aBody: $body");

      if (getAdditionalResponse.code == 1) {
        _logger.d("getAdditionalResponse: ${getAdditionalResponse.toJson()}");

        for (int i = 0;
            i < getAdditionalResponse.data!.additional!.length;
            i++) {
          selectAdditionalList.add(0);
          debugPrint("selectAdditionalList: ${selectAdditionalList.length}");
        }

        _loader.hideLoader(context!);
        isDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("getAdditionalResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("getAdditionalResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
