// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {await Firebase.initializeApp();}
//
// class FCM {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   Future<void> init() async {
//     await requestIosPermission();
//     await getToken();
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Foreground message received: ${message.notification?.title}");
//     });
//   }
//   // Future<void> init() async{
//   //   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   //   Future.wait([
//   //   requestIosPermission(),
//   //   getToken(),
//   //   ]);
//   //
//   // }
//
//   Future<void> requestIosPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');
//   }
//
//   Future<String?> getToken() async {
//     // use the returned token to send messages to users from your custom server
//     String? token = await messaging.getToken();
//     print('The token is: $token');
//     return token;
//   }
// }
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class FCM {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await requestIosPermission();
    await getToken();
    await initLocalNotifications();
    await initLocalNotifications();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message received: ${message.notification?.title}");

      if (message.notification != null) {
        showNotification(message);
      }
    });
  }

  Future<void> requestIosPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('======================================================================='
        '===============================+++++++++++++++++++++++++++++++++++++++++++++++'
        'User granted permission: ${settings.authorizationStatus}');
  }

  Future<String?> getToken() async {
    String? token = await messaging.getToken();
    print('=========================================================================='
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
        'The token is: $token');
    return token;
  }

  Future<void> initLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("Notification Clicked: ${response.payload}");
      },
    );
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'high_importance_channel', // Same as the notification channel ID
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? "No Title",
      message.notification?.body ?? "No Body",
      platformChannelSpecifics,
    );
  }
}
