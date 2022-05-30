import '../models/error_model/ErrorResponse.dart';

class Models {
  //Error
  static const String errorModel = "errorModel";

  static const String loginModel = "loginModel";
  static const String signupModel = "signupModel";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      // case loginModel:
      //   return LoginResponse.fromJson(json);
      // case signupModel:
      //   return RegisterResponse.fromJson(json);
      case errorModel:
        return ErrorResponse.fromJson(json);
    }
  }
}
