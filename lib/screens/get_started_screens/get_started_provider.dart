import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/widgets/loader.dart';
import '../../models/cities/GetCitiesResponse.dart';
import '../../models/packages/PackagesResponse.dart';
import '../../network_manager/api_url.dart';
import '../../network_manager/models.dart';
import '../../network_manager/my_api.dart';
import '../../push_notification_service/FirebasePushNotificationService.dart';

class GetStartedProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  final Loader _loader = Loader();

  bool isCityDataLoaded = false;
  bool isDataLoaded = false;

  PackagesResponse packagesResponse = PackagesResponse();
  GetCitiesResponse getCitiesResponse = GetCitiesResponse();

  List<String> cityList = [];
  List<String> cityIdList = [];
  List<Map<String, dynamic>> citiesList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isCityDataLoaded = false;
    isDataLoaded = false;
    await FirebasePushNotificationService.initializeNotification(
        userTopic: "qbus");
  }

  Future<void> getPackagesData() async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "code": "",
        "date_from": "",
        "date_to": "",
        "time_from": "",
        "starting_city_id": "",
        "additional": [],
        "offset": 0
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
        _logger.e("packagesResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("packagesResponseError: ${e.toString()}");
      _logger.e("packagesResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }

  Future<void> getCitiesData() async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      cityList.clear();
      cityIdList.clear();
      citiesList.clear();

      debugPrint("URL: $getCitiesApiUrl");
      getCitiesResponse = await MyApi.callGetApi(
          url: getCitiesApiUrl,
          myHeaders: header,
          modelName: Models.citiesModel);

      if (getCitiesResponse.code == 1) {
        _logger.i("getCitiesResponse: ${getCitiesResponse.toJson()}");

        for (int i = 0; i < getCitiesResponse.data!.cites!.length; i++) {
          var name = getCitiesResponse.data!.cites![i].name!.en.toString();
          var id = getCitiesResponse.data!.cites![i].id!.toString();

          Map<String, dynamic> map = {
            "id": id,
            "city": name,
          };
          cityList.add(name);
          cityIdList.add(id);
          citiesList.add(map);
        }
        isCityDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("getCitiesResponse: Something wrong");
      }
    } catch (e) {
      debugPrint("getCitiesResponseError: ${e.toString()}");
      _logger.e("getCitiesResponseError: ${e.toString()}");
    }
  }
}
