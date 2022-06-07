import 'package:qbus/models/about_us/GetAboutUsResponse.dart';
import 'package:qbus/models/additional/GetAdditionalResponse.dart';
import 'package:qbus/models/auth/SignUpResponse.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import '../models/cities/GetCitiesResponse.dart';
import '../models/error_model/ErrorResponse.dart';
import '../models/packages/PackagesResponse.dart';

class Models {
  //Error
  static const String errorModel = "errorModel";

  static const String packagesModel = "packagesModel";
  static const String tripsModel = "tripsModel";
  static const String additionalModel = "additionalModel";
  static const String aboutUsModel = "aboutUsModel";
  static const String citiesModel = "citiesModel";

  static const String loginModel = "loginModel";
  static const String signupModel = "signupModel";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case citiesModel:
        return GetCitiesResponse.fromJson(json);
      case signupModel:
        return SignUpResponse.fromJson(json);
      case aboutUsModel:
        return GetAboutUsResponse.fromJson(json);
      case packagesModel:
        return PackagesResponse.fromJson(json);
      case additionalModel:
        return GetAdditionalResponse.fromJson(json);
      case tripsModel:
        return TripsResponse.fromJson(json);
      case errorModel:
        return ErrorResponse.fromJson(json);
    }
  }
}
