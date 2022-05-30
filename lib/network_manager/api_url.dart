// BaseUrl
const String baseUrl = "https://api.findersseat.com/api/v1";
// Auth
const String loginApiUrl = "$baseUrl/account/login";
const String signUpApiUrl = "$baseUrl/account/register";
const String signUpEmailVerifyApiUrl = "$baseUrl/verify/email";
const String forgotPasswordApiUrl = "$baseUrl/account/forgot-password";
const String resetPasswordApiUrl = "$baseUrl/account/reset-password";
const String resendEmailVerificationApiUrl = "$baseUrl/verify/email/resend";
//Profile
const String userAvatarPhotoApiUrl = "$baseUrl/profile/avatar";
const String userCompleteProfileApiUrl = "$baseUrl/profile/create";

// HOME SCREEN
const String getRandomUserProfilesApiUrl = "$baseUrl/profile/list";
const String getCurrentUserApiUrl = "$baseUrl/profile/show";
const String updateCurrentUserProfileApiUrl = "$baseUrl/profile/update";
const String userProfilePhotoApiUrl = "$baseUrl/profile/pictures";
const String getUserProfilePicturesListApiUrl =
    "$baseUrl/profile/pictures/list";

// People Likes and DisLikes
const String getLikedPeopleProfilesApiUrl =
    "$baseUrl/profile/get-liked-profiles";
const String getDislikedPeopleProfilesApiUrl =
    "$baseUrl/profile/get-disliked-profiles";
const String getMatchesApiUrl = "$baseUrl/profile/matches";
const String getUserLikedProfileApiUrl = "$baseUrl/profile/who-liked-profile";
const String getProfileDetailApiUrl = "$baseUrl/profile/detail/";
const String getFilteredUserProfileApiUrl =
    "$baseUrl/profile/get-filtered-profiles";

const String addLikedProfileApiUrl = "$baseUrl/profile/add-liked-profile";
const String addDislikedProfileApiUrl = "$baseUrl/profile/add-disliked-profile";
const String getHotOrNotProfilesApiUrl = "$baseUrl/profile/get-hot-profiles";
const String addHotProfileApiUrl = "$baseUrl/profile/add-hot-profile";
const String removeNotProfileApiUrl = "$baseUrl/profile/remove-hot-profile";
// Blocked
const String addBlockedProfileApiUrl = "$baseUrl/profile/add-blocked-profile";
const String removeBlockedProfileApiUrl =
    "$baseUrl/profile/remove-blocked-profile";

//Settings
const String saveSocialLinkApiUrl = "$baseUrl/profile/settings/social-links";
const String savePrivacyApiUrl = "$baseUrl/profile/settings/privacy";
const String saveGeneralApiUrl = "$baseUrl/profile/settings/general";
const String deleteUserAccountApiUrl = "$baseUrl/account/delete";
const String getAffilitatesApiUrl = "$baseUrl/profile/settings/affilitates";
const String getBlockedUserApiUrl = "$baseUrl/profile/get-blocked-profiles";
const String saveSettingPasswordApiUrl = "$baseUrl/profile/settings/password";
const String saveNotificationSettingApiUrl =
    "$baseUrl/profile/settings/manage-notifications";

//Ignore
const String kGoogleApiKey = "AIzaSyB20XGkT-LGQV7DexxbA5_q_HQrss1moSQ";
