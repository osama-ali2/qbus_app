import 'package:qbus/models/about_us/GetAboutUsResponse.dart';
import 'package:qbus/models/additionals/PackageAdditionalsResponse.dart';
import 'package:qbus/models/additionals/TripAdditionalsResponse.dart';
import 'package:qbus/models/auth/ForgotPasswordResponse.dart';
import 'package:qbus/models/auth/GetVerifyPhoneResponse.dart';
import 'package:qbus/models/auth/LoginResponse.dart';
import 'package:qbus/models/auth/LogoutResponse.dart';
import 'package:qbus/models/auth/SignUpResponse.dart';
import 'package:qbus/models/auth/UserResponse.dart';
import 'package:qbus/models/booking_history_model/TripHistoryResponse.dart';
import 'package:qbus/models/contact_us/GetContactUsResponse.dart';
import 'package:qbus/models/error_model/ValidatingErrorResponse.dart';
import 'package:qbus/models/hotel/hotel_room_response.dart';
import 'package:qbus/models/packages/PackageDetailResponse.dart';
import 'package:qbus/models/privacy_policy/PrivacyPolicyResponse.dart';
import 'package:qbus/models/privacy_policy/ReturnPolicyResponse.dart';
import 'package:qbus/models/profile/UpdateUserProfileResponse.dart';
import 'package:qbus/models/rating_models/PackageRatingResponse.dart';
import 'package:qbus/models/rating_models/TripRatingResponse.dart';
import 'package:qbus/models/trips/MultiOrdersTripResponse.dart';
import 'package:qbus/models/trips/OneWayOrdersTripResponse.dart';
import 'package:qbus/models/trips/RoundOrdersTripResponse.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import '../models/additionals/GetAdditionalResponse.dart';
import '../models/booking_history_model/PackageHistoryResponse.dart';
import '../models/cities/GetCitiesResponse.dart';
import '../models/error_model/ErrorResponse.dart';
import '../models/packages/PackagesResponse.dart';
import '../models/passenger_models/GetCountriesResponse.dart';
import '../models/passenger_models/IdentityProofTypesResponse.dart';
import '../models/trips/OneWayOrderReviewResponse.dart';
import '../models/trips/OrderReviewResponse.dart';

class Models {
  //Error
  static const String errorModel = "errorModel";
  static const String validateErrorModel = "validateErrorModel";

  static const String packagesModel = "packagesModel";
  static const String packagesDetailModel = "packagesDetailModel";
  static const String tripsModel = "tripsModel";
  static const String additionalModel = "additionalModel";
  static const String tripAdditionalsModel = "tripAdditionalsModel";
  static const String packageAdditionalsModel = "packageAdditionalsModel";
  static const String aboutUsModel = "aboutUsModel";
  static const String citiesModel = "citiesModel";
  static const String contactUsModel = "contactUsModel";
  static const String verifyPhoneModel = "verifyPhoneModel";
  static const String userProfileModel = "userProfileModel";
  static const String privacyPolicyModel = "privacyPolicyModel";
  static const String returnPolicyModel = "returnPolicyModel";
  static const String updateUserProfileModel = "updateUserProfileModel";

  static const String loginModel = "loginModel";
  static const String signupModel = "signupModel";
  static const String logoutModel = "logoutModel";
  static const String forgotPasswordModel = "forgotPasswordModel";

  //Trips:
  static const String oneWayOrderTripModel = "oneWayOrderTripModel";
  static const String roundOrderTripModel = "roundOrderTripModel";
  static const String multiOrderTripModel = "multiOrderTripModel";
  static const String ordersReviewModel = "ordersReviewModel";

  //Histories:
  static const String tripBookingHistoryModel = "tripBookingHistoryModel";
  static const String packageBookingHistoryModel = "packageBookingHistoryModel";

  //Ratings
  static const String packageRatingModel = "packageRatingModel";
  static const String tripRatingModel = "tripRatingModel";

  // Hotels
  static const String hotelRoomModel = "hotelRoomModel";

  // Identity Proof Types Model
  static const String identityProofTypesModel = "identityProofTypesModel";

  // Get Countries Model
  static const String getCountriesModel = "getCountriesModel";

  // One Way Order Review Response
  static const String oneWayOrderReviewModel = "oneWayOrderReviewModel";
  static const String roundOrderReviewModel = "roundOrderReviewModel";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case packageRatingModel:
        return PackageRatingResponse.fromJson(json);
      case tripRatingModel:
        return TripRatingResponse.fromJson(json);
      case packageBookingHistoryModel:
        return PackageHistoryResponse.fromJson(json);
      case tripBookingHistoryModel:
        return TripHistoryResponse.fromJson(json);
      case oneWayOrderTripModel:
        return OneWayOrdersTripResponse.fromJson(json);
      case multiOrderTripModel:
        return MultiOrdersTripResponse.fromJson(json);
      case roundOrderTripModel:
        return RoundOrdersTripResponse.fromJson(json);
      case returnPolicyModel:
        return ReturnPolicyResponse.fromJson(json);
      case updateUserProfileModel:
        return UpdateUserProfileResponse.fromJson(json);
      case packageAdditionalsModel:
        return PackageAdditionalsResponse.fromJson(json);
      case tripAdditionalsModel:
        return TripAdditionalsResponse.fromJson(json);
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
      case hotelRoomModel:
        return HotelRoomResponse.fromJson(json);
      case identityProofTypesModel:
        return IdentityProofTypesResponse.fromJson(json);
      case getCountriesModel:
        return GetCountriesResponse.fromJson(json);
      case ordersReviewModel:
        return OrderReviewResponse.fromJson(json);
      case oneWayOrderReviewModel:
        return OneWayOrderReviewResponse.fromJson(json);
      case roundOrderReviewModel:
        return RoundOrdersTripResponse.fromJson(json);
      case errorModel:
        return ErrorResponse.fromJson(json);
      case validateErrorModel:
        return ValidatingErrorResponse.fromJson(json);
    }
  }
}
