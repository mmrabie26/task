// import 'dart:developer';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// abstract class FireBaseNotificationService {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//
//   static Future<void> init() async {
//     await _messaging.requestPermission(alert: true, badge: true, sound: true);
//     final token = await _messaging.getToken();
//     log("🔑 FCM Token: $token");
//     // on foreground
//     FirebaseMessaging.onMessage.listen((message) {});
//
//     // on background
//     FirebaseMessaging.onBackgroundMessage((message) async {
//       if (message.notification?.title != null) {}
//     });
//
//     // when open notification
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       if (message.notification?.title != null) {}
//     });
//
//     // app on terminated
//     _messaging.getInitialMessage().then((message) {
//       if (message?.notification?.title != null) {}
//     });
//   }
// }
