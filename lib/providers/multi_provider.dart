import 'package:provider/provider.dart';
import 'package:qbus/screens/auth/login_screens/login_provider.dart';
import 'package:qbus/screens/auth/sign_up_screens/sign_up_provider.dart';
import 'package:qbus/screens/bottombar/screens/contact_us_screens/contact_us_provider.dart';
import 'package:qbus/screens/bottombar/screens/explore_screens/explore_provider.dart';
import 'package:qbus/screens/bottombar/screens/history_screens/history_provider.dart';
import 'package:qbus/screens/bottombar/screens/search_screens/search_provider.dart';
import 'package:qbus/screens/bottombar/screens/selectAddition/select_addition_provider.dart';
import 'package:qbus/screens/splash_screens/splash_provider.dart';

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
];
