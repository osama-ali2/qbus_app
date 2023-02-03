import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/network_manager/api_url.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/widgets/loader.dart';

import '../../../../../local_cache/utils.dart';
import '../../../../../models/cities/GetCitiesResponse.dart';
import '../../../../../models/profile/UpdateUserProfileResponse.dart';
import '../../../../../network_manager/models.dart';
import '../../../../../network_manager/my_api.dart';

class EditUserProfileProvider with ChangeNotifier {
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  UpdateUserProfileResponse updateProfileResponse = UpdateUserProfileResponse();
  bool isProfileUpdated = false;

  GetCitiesResponse getCitiesResponse = GetCitiesResponse();
  List<String> cityList = [];
  List<String> cityIdList = [];

  bool isCityDataLoaded = false;

  List<Map<String, dynamic>> citiesList = [];

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isProfileUpdated = false;
    isCityDataLoaded = false;
    getCitiesData();
  }

  Future<void> getCitiesData() async {
    try {
      // _loader.showLoader(context: context);
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
        _logger.d("getCitiesResponse: ${getCitiesResponse.toJson()}");

        for (int i = 0; i < getCitiesResponse.data!.cites!.length; i++) {
          var name = getCitiesResponse.data!.cites![i].name!.en.toString();
          var id = getCitiesResponse.data!.cites![i].id!.toString();

          Map<String, dynamic> map = {
            "id": id,
            "city": name,
          };
          // _logger.d("name: $name");
          // _logger.d("id: $id");
          // _logger.d("MapList: $map");
          cityList.add(name);
          cityIdList.add(id);
          citiesList.add(map);
        }

        // _loader.hideLoader(context!);
        isCityDataLoaded = true;
        notifyListeners();
      } else {
        debugPrint("getCitiesResponse: Something wrong");
        // _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("getCitiesResponseError: ${e.toString()}");
      // _loader.hideLoader(context!);
    }
  }

  Future<void> updateUserProfile(
      {required String name,
      required String cityId,
      required String userEmail,
      required String maritalStatus,
      required String address}) async {
    try {
      _loader.showLoader(context: context);

      var userToken = PreferenceUtils.getString(Strings.loginUserToken);
      // final userEmail = PreferenceUtils.getString(Strings.loginEmail);
      _logger.d("userToken: $userToken");

      Map<String, dynamic> header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $userToken"
      };

      final body = {
        "name": name,
        "email": userEmail,
        "city_id": cityId,
        "marital_status": maritalStatus.toLowerCase(),
        "address": address
      };

      debugPrint("URL: $updateUserProfileApiUrl");
      updateProfileResponse = await MyApi.callPostApi(
          url: updateUserProfileApiUrl,
          myHeaders: header,
          body: body,
          modelName: Models.updateUserProfileModel);
      _logger.d("body: $body");

      if (updateProfileResponse.code == 1) {
        _logger.d("updateProfileResponse: ${updateProfileResponse.toJson()}");
        Toasts.getSuccessToast(text: updateProfileResponse.data!.message);
        _loader.hideLoader(context!);
        isProfileUpdated = true;
        notifyListeners();
      } else {
        debugPrint("updateProfileResponse: Something wrong");
        _loader.hideLoader(context!);
      }
    } catch (e) {
      debugPrint("updateProfileResponseError: ${e.toString()}");
      _loader.hideLoader(context!);
    }
  }
}
