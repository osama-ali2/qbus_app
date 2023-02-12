import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth/LoginResponse.dart';
import 'package:qbus/resources/resources.dart';

class PreferenceUtils {
  static String? userImage;
  var time = DateTime;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    if (PreferenceUtils._prefsInstance != null) {
      return _prefsInstance?.getString(key) ?? defValue ?? "";
    }
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value); //?? Future.value(null);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value); //?? Future.value(null);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value); //?? Future.value(null);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }

  static Future setUploadImage(uploadProfilePictureResponse) async {
    PreferenceUtils.setString(
        Strings.filePath, uploadProfilePictureResponse.data!.message!);
  }

  static Future setUserImage(image) async {
    await PreferenceUtils.setString(Strings.userImageKey, image ?? "");
  }

  static String? getUserImage() {
    userImage = PreferenceUtils.getString(Strings.userImageKey)!;
    return userImage;
  }

  // Store User Response
  static Future setLoginResponse(LoginResponse loginResponse) async {
    await PreferenceUtils.setString(
        Strings.loginUserToken, loginResponse.data?.token ?? "");
    await PreferenceUtils.setString(
        Strings.loginName, loginResponse.data?.user?.name ?? "");
    await PreferenceUtils.setString(
        Strings.loginEmail, loginResponse.data?.user?.email ?? "");
    await PreferenceUtils.setString(
        Strings.loginWallet, loginResponse.data?.user?.wallet.toString() ?? "");
    await PreferenceUtils.setString(
        Strings.loginTopic, loginResponse.data?.topic.toString() ?? "");
  }

  // static Future setSignUpResponse(RegisterResponse registerResponse) async {
  //   await PreferenceUtils.setString(
  //       Strings.loginUserToken, registerResponse.data?.token ?? "");
  //   await PreferenceUtils.setString(Strings.loginUserId,
  //       registerResponse.data?.user?.userId.toString() ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.loginFirstName, registerResponse.data?.user?.firstName ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.loginLastName, registerResponse.data?.user?.lastName ?? "");
  //
  //   await PreferenceUtils.setString(
  //       Strings.loginName, registerResponse.data?.user?.userName ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.loginEmail, registerResponse.data?.user?.email ?? "");
  //   await PreferenceUtils.setString(Strings.loginEmailVerify,
  //       registerResponse.data?.user?.emailVerified.toString() ?? "");
  // }

  // static Future setEditProfileResponse(
  //     UpdatedUserProfileResponse updatedUserProfileResponse) async {
  //   await PreferenceUtils.setString(Strings.loginUserId,
  //       updatedUserProfileResponse.data?.user?.id.toString() ?? "");
  //   await PreferenceUtils.setString(Strings.loginFirstName,
  //       updatedUserProfileResponse.data?.user?.firstName ?? "");
  //   await PreferenceUtils.setString(Strings.loginLastName,
  //       updatedUserProfileResponse.data?.user?.lastName ?? "");
  //   await PreferenceUtils.setString(Strings.loginName,
  //       updatedUserProfileResponse.data?.user?.userName ?? "");
  // }

  static Future savePrivacyValues(
      {required bool? isSearch,
      required bool? isRandom,
      required bool? isFindMatch}) async {
    await PreferenceUtils.setBool(Strings.isSearch, isSearch ?? false);
    await PreferenceUtils.setBool(Strings.isRandom, isRandom ?? false);
    await PreferenceUtils.setBool(Strings.isFindMatch, isFindMatch ?? false);
  }

  static Future saveNotificationValues({
    required bool? isViewProfile,
    required bool? isReceiveMessage,
    required bool? isLikeProfile,
    required bool? isPurchaseNotification,
    required bool? isNewGift,
    required bool? isNewMatch,
    required bool? isChatRequest,
  }) async {
    await PreferenceUtils.setBool(
        Strings.isViewProfile, isViewProfile ?? false);
    await PreferenceUtils.setBool(
        Strings.isReceiveMessage, isReceiveMessage ?? false);
    await PreferenceUtils.setBool(
        Strings.isLikeProfile, isLikeProfile ?? false);
    await PreferenceUtils.setBool(
        Strings.isPurchaseNotification, isPurchaseNotification ?? false);
    await PreferenceUtils.setBool(Strings.isNewGift, isNewGift ?? false);
    await PreferenceUtils.setBool(Strings.isNewMatch, isNewMatch ?? false);
    await PreferenceUtils.setBool(
        Strings.isChatRequest, isChatRequest ?? false);
  }

  static clearPreferences() {
    _prefsInstance?.clear();
  }
}
