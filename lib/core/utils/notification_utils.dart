// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'dart:io';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }
//
// class NotificationUtils {
//   static Future<void> grantNotificationsPermission(
//       AppLocalizations? localisations) async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await messaging.getNotificationSettings();
//     settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: true,
//       sound: true,
//     );
//     if (settings.authorizationStatus != AuthorizationStatus.authorized &&
//         settings.authorizationStatus != AuthorizationStatus.provisional) {
//       Fluttertoast.showToast(
//         msg: localisations?.grantNotiPermissionPrompt ?? "",
//         toastLength: Toast.LENGTH_LONG,
//       );
//     } else {
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }
//   }
//
//   static Future<void>
//       setupAndEnableAndroidForegroundNotificationsListener() async {
//     if (!Platform.isAndroid) return;
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'zysky_notifications_channel',
//       'ZYSKY Alerts',
//       importance: Importance.max,
//     );
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//
//       if (notification != null && android != null) {
//         print("Message Received: ${notification.title}");
//         print("Message Received: ${notification.body}");
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//                 android: AndroidNotificationDetails(
//                   channel.id,
//                   channel.name,
//                   icon: "app_logo",
//                   priority: Priority.max,
//                 ),
//                 iOS: const DarwinNotificationDetails(
//                     presentAlert: true,
//                     presentSound: true,
//                     presentBadge: true)));
//       }
//     });
//   }
// }
