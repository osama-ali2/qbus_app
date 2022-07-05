import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/models/additionals/TripAdditionalsResponse.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/widgets/loader.dart';

import '../../models/additionals/GetAdditionalResponse.dart';
import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';

class SelectAdditionProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  bool isTripLoaded = false;

  // GetAdditionalResponse getAdditionalResponse = GetAdditionalResponse();
  TripAdditionalsResponse tripAdditionalsResponse = TripAdditionalsResponse();

  List<int> selectAdditionalList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> getAdditionalData({required String id}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      var url = "$tripAdditionalApiUrl$id";

      debugPrint("URL: $url");
      tripAdditionalsResponse = await MyApi.callGetApi(
          url: url, myHeaders: header, modelName: Models.tripAdditionalsModel);
      // debugPrint("aBody: $body");

      if (tripAdditionalsResponse.code == 1) {
        _logger
            .d("tripAdditionalsResponse: ${tripAdditionalsResponse.toJson()}");

        var length = tripAdditionalsResponse.data!.additional!.length;
        for (int i = 0; i < length; i++) {
          selectAdditionalList.add(0);
          debugPrint("selectAdditionalList: ${selectAdditionalList.length}");
        }

        _loader.hideLoader(context!);
        isTripLoaded = true;
        notifyListeners();
      } else {
        debugPrint("tripAdditionalsResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("tripAdditionalsResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
