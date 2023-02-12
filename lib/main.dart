import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qbus/L10n/L10n.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/providers/multi_provider.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/screens/splash_screens/splash_screen.dart';

import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  debugPrint('Handling a background message ${message.data}');
}

//*
// [Flutter] Version: 3.3.10
// [Developer]: Tayyab Mughal [Fullstack Mobile Application Engineer]
// [Github]: https://www.github.com/tayyabmughal676
// [Upwork]: https://www.upwork.com/freelancers/~01d478bbabdfa2e861
// [Email]: mailto:tayyabmughal676@gmail.com
// *//

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  // Foreground Notification While the app running state
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint(
          'Message also contained a notification: ${message.notification!.title}');
      if (message.data['type'] == 'chat') {
        debugPrint("Type is Chat Opened");
      }
    }
  });

  // When User click the notification and the app will response
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    debugPrint("onMessageOpenedApp: ${event.data}");
    if (event.data['type'] == 'chat') {
      debugPrint("Type is Chat Opened");
    }
  });

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
        //TODO: Uncomment this
        locale: const Locale('ar'),
        //Locale(PreferenceUtils.getString(Strings.language) ?? "en"),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
