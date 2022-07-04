import 'package:qbus/models/about_us/GetAboutUsResponse.dart';
import 'package:qbus/models/additional/GetAdditionalResponse.dart';
import 'package:qbus/models/auth/ForgotPasswordResponse.dart';
import 'package:qbus/models/auth/GetVerifyPhoneResponse.dart';
import 'package:qbus/models/auth/LoginResponse.dart';
import 'package:qbus/models/auth/LogoutResponse.dart';
import 'package:qbus/models/auth/SignUpResponse.dart';
import 'package:qbus/models/auth/UserResponse.dart';
import 'package:qbus/models/contact_us/GetContactUsResponse.dart';
import 'package:qbus/models/error_model/ValidatingErrorResponse.dart';
import 'package:qbus/models/packages/PackageDetailResponse.dart';
import 'package:qbus/models/privacy_policy/PrivacyPolicyResponse.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import '../models/cities/GetCitiesResponse.dart';
import '../models/error_model/ErrorResponse.dart';
import '../models/packages/PackagesResponse.dart';

class Models {
  //Error
  static const String errorModel = "errorModel";
  static const String validateErrorModel = "validateErrorModel";

  static const String packagesModel = "packagesModel";
  static const String packagesDetailModel = "packagesDetailModel";
  static const String tripsModel = "tripsModel";
  static const String additionalModel = "additionalModel";
  static const String aboutUsModel = "aboutUsModel";
  static const String citiesModel = "citiesModel";
  static const String contactUsModel = "contactUsModel";
  static const String verifyPhoneModel = "verifyPhoneModel";
  static const String userProfileModel = "userProfileModel";
  static const String privacyPolicyModel = "privacyPolicyModel";

  static const String loginModel = "loginModel";
  static const String signupModel = "signupModel";
  static const String logoutModel = "logoutModel";
  static const String forgotPasswordModel = "forgotPasswordModel";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case packagesDetailModel:
        return PackageDetailResponse.fromJson(json);
      case privacyPolicyModel:
        return PrivacyPolicyResponse.fromJson(json);
      case forgotPasswordModel:
        return ForgotPasswordResponse.fromJson(json);
      case userProfileModel:
        return UserResponse.fromJson(json);
      case logoutModel:
        return LogoutResponse.fromJson(json);
      case verifyPhoneModel:
        return GetVerifyPhoneResponse.fromJson(json);
      case contactUsModel:
        return GetContactUsResponse.fromJson(json);
      case loginModel:
        return LoginResponse.fromJson(json);
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
      case validateErrorModel:
        return ValidatingErrorResponse.fromJson(json);
    }
  }
}
