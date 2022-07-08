import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/L10n/L10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qbus/providers/multi_provider.dart';
import 'package:qbus/screens/splash_screens/splash_screen.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        title: 'QBUS',
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        //home: SignUpScreen(),
        locale: Locale(PreferenceUtils.getString(Strings.language) ?? "en"),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
