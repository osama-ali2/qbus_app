import 'package:provider/provider.dart';
import 'package:qbus/screens/auth/login_screens/login_provider.dart';
import 'package:qbus/screens/auth/sign_up_screens/sign_up_provider.dart';
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
];
