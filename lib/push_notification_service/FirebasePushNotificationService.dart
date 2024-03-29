import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FirebasePushNotificationService {
  static final Logger _logger = Logger();

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description,
    importance: Importance.max,
  );

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> flutterLocalNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint("onMessageRemote: $message");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                // other properties...
              ),
            ));
      }
    });
  }

  static Future<void> initMainPushNotificationService() async {
    try {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true, // Required to display a heads up notification
            badge: true,
            sound: true,
          )
          .then((value) =>
              {debugPrint("setForegroundNotificationPresentationOption")});
    } on FirebaseException {
      debugPrint("initPushNotificationService: Error");
    }
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    debugPrint('Handling a background message ${message.messageId}');
  }

  ///Firebase Push Notification
  static Future<void> initializeNotification({
    required String userTopic,
  }) async {
    String str = userTopic.toLowerCase();
    String topic = str.replaceAll(RegExp('[^A-Za-z0-9]'), '');

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      // Notification Center
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _logger.d('User granted permission: ${settings.authorizationStatus}');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }

    // subscribe to topic on each app start-up
    await FirebaseMessaging.instance.subscribeToTopic(topic).then((value) {
      _logger.d("TOPIC: $topic subscribe successful");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.d('Got a message whilst in the foreground!');
      _logger.d('Message data: ${message.data}');

      if (message.notification != null) {
        _logger.d(
            'Message also contained a notification: ${message.notification!.title}');
        if (message.data['type'] == 'chat') {
          _logger.d("Type is Chat Opened");
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint("onMessageOpenedApp: ${event.data}");
    });
  }

  // void _handleMessage(RemoteMessage message) {
  //   if (message.data['type'] == 'chat') {
  //     Navigator.pushNamed(context, '/chat',
  //       arguments: ChatArguments(message),
  //     );
  //   }
  // }

  // Unsubscribe From Topic
  static Future<void> unsubscribeFromTopic({required String email}) async {
    String str = email.toLowerCase();
    String userEmail = str.replaceAll(RegExp('[^A-Za-z0-9]'), '');
    _logger.d("UserEmail for topic:$userEmail");
    // subscribe to topic on each app start-up
    await FirebaseMessaging.instance.unsubscribeFromTopic(email).then((value) {
      _logger.d("TOPIC: Unsubscribe successful");
    }).onError((error, stackTrace) {
      _logger.d("TOPICError: Unsubscribe successful");
    });
  }

  // Topic based Push Notification from Device to Device
  static Future<bool> callOnFcmApiSendPushNotifications(
      {required String title,
      required String body,
      required String userSubscribedTopic}) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "to": "/topics/$userSubscribedTopic",
      "notification": {
        "title": title,
        "body": body,
      },
      "data": {
        "type": 'chat',
        "id": '0',
        "click_action": 'FLUTTER_NOTIFICATION_CLICK',
      }
    };

    debugPrint("bodyData: $data");

    // Use FCM key
    var key =
        "AAAAybEwsXQ:APA91bHutPuRRBQTNBgjQCelA0ZeY4EViTx2TfcZBD8pnnpZjJz83HZ-cJvwR8BaO4G7P48CZ5FNe7VaipJOHKDeZjMQrze_MFZ6Yc7G0DVoMj9Zeyl8El2YdMPb5_XqtKwR4KCI8xNO";
    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=$key'
      // 'key=YOUR_SERVER_KEY'
    };

    debugPrint("headers: $headers");

    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      debugPrint('TopicBaseFCM: Test okay push CFM');
      return true;
    } else {
      debugPrint('TopicBaseFCM: CFM Error');
      // on failure do sth
      return false;
    }
  }
}
