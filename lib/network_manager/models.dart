import 'package:qbus/models/trips/TripsResponse.dart';
import '../models/error_model/ErrorResponse.dart';
import '../models/packages/PackagesResponse.dart';

class Models {
  //Error
  static const String errorModel = "errorModel";

  static const String packagesModel = "packagesModel";
  static const String tripsModel = "tripsModel";

  static const String loginModel = "loginModel";
  static const String signupModel = "signupModel";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case packagesModel:
        return PackagesResponse.fromJson(json);
      case tripsModel:
        return TripsResponse.fromJson(json);
      case errorModel:
        return ErrorResponse.fromJson(json);
    }
  }
}
