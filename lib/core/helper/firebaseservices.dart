// import 'package:dartz/dartz.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:truetone/core/error/Failure.dart';
// import 'package:truetone/core/helper/shared_pref.dart';

// import '../di/si.dart';

// class FirebaseMessageService {
//   static Future<Either<Failure, String>> gettoken() async {
//     try {
//       final String? fcmToken = await FirebaseMessaging.instance.getToken();
//       sl<Cashhelper>().setdevicetoken(fcmToken);
//       return Right(fcmToken!);
//     } catch (e) {
//       return Left(Failure.gineralerror(e.toString()));
//     }
//   }

//   listentonotifcation() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received a message in the foreground!');
//       print('Message data: ${message.data}');

//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//     });
//   }

//   firebasegetperrmisn() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('✅ المستخدم وافق على الإشعارات');
//     } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
//       print('❌ المستخدم رفض الإشعارات');
//     } else {
//       print('❔ حالة غير معروفة: ${settings.authorizationStatus}');
//     }
//   }
// }
