import 'package:provider/provider.dart';
import 'package:qbus/screens/package_screens/package_detail_screens/package_detail_provider.dart';
import 'package:qbus/screens/package_screens/package_filter_screens/package_filter_provider.dart';
import 'package:qbus/screens/package_screens/package_hotels/package_hotels.dart';
import 'package:qbus/screens/package_screens/package_passenger_screens/package_passenger_provider.dart';
import 'package:qbus/screens/package_screens/package_provider.dart';
import 'package:qbus/screens/package_screens/package_select_addition_screens/package_select_addition_provider.dart';
import '../screens/auth/forgot_screens/forgot_provider.dart';
import '../screens/auth/forgot_screens/phone_number_screens/phone_number_provider.dart';
import '../screens/auth/login_screens/login_provider.dart';
import '../screens/auth/phone_activation_screens/phone_activation_provider.dart';
import '../screens/auth/sign_up_screens/sign_up_provider.dart';
import '../screens/bottombar/bottom_bar_screens/booking_history_screens/booking_history_provider.dart';
import '../screens/bottombar/bottom_bar_screens/contact_us_screens/contact_us_provider.dart';
import '../screens/bottombar/bottom_bar_screens/package_history_screens/package_history_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/about_us_screens/about_us_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/change_password_screens/change_password_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/edit_user_profile_screens/edit_user_profile_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/privacy_policy_screens/privacy_policy_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/profile_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/return_policy_screens/return_policy_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/wallet_screens/wallet_provider.dart';
import '../screens/bottombar/bottom_bar_screens/setting_screens/setting_provider.dart';
import '../screens/bottombar/bottom_bar_screens/setting_select_lang_screens/setting_select_lang_provider.dart';
import '../screens/get_started_screens/get_started_provider.dart';
import '../screens/hotel_screens/hotel_provider.dart';
import '../screens/passenger_screens/passenger_provider.dart';
import '../screens/review_order_screens/review_order_provider.dart';
import '../screens/round_trip_flow/step_one/round_trip_hotel_screens/round_trip_hotel_provider.dart';
import '../screens/round_trip_flow/step_one/round_trip_passenger_screens/round_trip_passenger_provider.dart';
import '../screens/round_trip_flow/step_one/round_trip_step_one_provider.dart';
import '../screens/round_trip_flow/step_one/step_one_select_addition/step_one_select_addition_provider.dart';
import '../screens/round_trip_flow/step_two/round_trip_review_order_screens/round_trip_review_order_provider.dart';
import '../screens/round_trip_flow/step_two/round_trip_step_two_provider.dart';
import '../screens/round_trip_flow/step_two/step_two_select_addition/step_two_select_addition_provider.dart';
import '../screens/select_addition_screens/select_addition_provider.dart';
import '../screens/splash_screens/splash_provider.dart';
import '../screens/trip_filter_screens/trip_filter_provider.dart';
import '../screens/trips_search_screens/trips_search_provider.dart';

final multiProviders = [
  ChangeNotifierProvider<SplashProvider>(
    create: (_) => SplashProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SignUpProvider>(
    create: (_) => SignUpProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SearchProvider>(
    create: (_) => SearchProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SelectAdditionProvider>(
    create: (_) => SelectAdditionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageProvider>(
    create: (_) => PackageProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ContactUsProvider>(
    create: (_) => ContactUsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<GetStartedProvider>(
    create: (_) => GetStartedProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ProfileProvider>(
    create: (_) => ProfileProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SettingProvider>(
    create: (_) => SettingProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SettingSelectLangProvider>(
    create: (_) => SettingSelectLangProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<AboutUsProvider>(
    create: (_) => AboutUsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PrivacyPolicyProvider>(
    create: (_) => PrivacyPolicyProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ReturnPolicyProvider>(
    create: (_) => ReturnPolicyProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BookingHistoryProvider>(
    create: (_) => BookingHistoryProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageFilterProvider>(
    create: (_) => PackageFilterProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<TripFilterProvider>(
    create: (_) => TripFilterProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PhoneActivationProvider>(
    create: (_) => PhoneActivationProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ForgotProvider>(
    create: (_) => ForgotProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<EditUserProfileProvider>(
    create: (_) => EditUserProfileProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ChangePasswordProvider>(
    create: (_) => ChangePasswordProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<WalletProvider>(
    create: (_) => WalletProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageDetailProvider>(
    create: (_) => PackageDetailProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageSelectAdditionProvider>(
    create: (_) => PackageSelectAdditionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageSelectAdditionProvider>(
    create: (_) => PackageSelectAdditionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PhoneNumberProvider>(
    create: (_) => PhoneNumberProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageHistoryProvider>(
    create: (_) => PackageHistoryProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<StepTwoSelectAdditionProvider>(
    create: (_) => StepTwoSelectAdditionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<StepOneSelectAdditionProvider>(
    create: (_) => StepOneSelectAdditionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<RoundTripStepOneProvider>(
    create: (_) => RoundTripStepOneProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<RoundTripStepTwoProvider>(
    create: (_) => RoundTripStepTwoProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PassengerProvider>(
    create: (_) => PassengerProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<HotelProvider>(
    create: (_) => HotelProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ReviewOrderProvider>(
    create: (_) => ReviewOrderProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<RoundTripPassengerProvider>(
    create: (_) => RoundTripPassengerProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<RoundTripHotelProvider>(
    create: (_) => RoundTripHotelProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<RoundTripReviewOrderProvider>(
    create: (_) => RoundTripReviewOrderProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackagePassengerProvider>(
    create: (_) => PackagePassengerProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageHotelTripOneFilterProvider>(
    create: (_) => PackageHotelTripOneFilterProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageHotelTripOneProvider>(
    create: (_) => PackageHotelTripOneProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageHotelTripTwoFilterProvider>(
    create: (_) => PackageHotelTripTwoFilterProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PackageHotelTripTwoProvider>(
    create: (_) => PackageHotelTripTwoProvider(),
    lazy: true,
  ),
];
