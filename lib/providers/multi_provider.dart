import 'package:provider/provider.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/profile_screens/about_us_screens/about_us_provider.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/profile_screens/booking_history_screens/booking_history_provider.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/profile_screens/privacy_policy_screens/privacy_policy_provider.dart';
import 'package:qbus/screens/get_started_screens/get_started_provider.dart';
import '../screens/auth/login_screens/login_provider.dart';
import '../screens/auth/sign_up_screens/sign_up_provider.dart';
import '../screens/bottombar/bottom_bar_screens/contact_us_screens/contact_us_provider.dart';
import '../screens/bottombar/bottom_bar_screens/history_screens/history_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/profile_provider.dart';
import '../screens/bottombar/bottom_bar_screens/profile_screens/return_policy_screens/return_policy_provider.dart';
import '../screens/bottombar/bottom_bar_screens/setting_screens/setting_provider.dart';
import '../screens/bottombar/bottom_bar_screens/setting_select_lang_screens/setting_select_lang_provider.dart';

import '../screens/explore_screens/explore_provider.dart';
import '../screens/search_screens/search_provider.dart';
import '../screens/selectAddition/select_addition_provider.dart';
import '../screens/splash_screens/splash_provider.dart';

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
  ChangeNotifierProvider<HistoryProvider>(
    create: (_) => HistoryProvider(),
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
  ChangeNotifierProvider<ExploreProvider>(
    create: (_) => ExploreProvider(),
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
];
