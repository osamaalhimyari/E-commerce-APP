import 'package:ecommerce2/core/functions/check_internet.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  // late Map serverAuthMesseging = {};
  // StatusRequest? statusRequest;
  // AuthTokenData authTokenData = AuthTokenData(Get.find());
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (await checkInternet()) {
      await Firebase.initializeApp();
      // FireBaseFCM.initService();
    }

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}

// class FireBaseFCM {
//   static initService() async {
//     // FirebaseMessaging messaging = FirebaseMessaging.instance;

//     // PushNotificationService.getAccessToken().then(
//     //   (value) {
//     //     // print('this is your access token');
//     //     // print('==============================');
//     //     // print(value);
//     //     // print('==============================');
//     //   },
//     // );

//     // await messaging.getToken().then(
//     //   (value) {
//     //     // print('this is your device token');
//     //     // print('==============================');
//     //     // print(value);
//     //     // print('==============================');
//     //   },
//     // );
//     // FirebaseMessaging.onBackgroundMessage(
//     //   (message) {
//     //     return backgroundHandler(message);
//     //   },
//     // );

//     FirebaseMessaging.instance.requestPermission();

//     // Handle messages while the app is in the foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received a message while in the foreground!');
//       print('Message data: ${message.toMap()}');
//     });

//     // Handle messages when the app is opened from a terminated state
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (message != null) {
//         print('Message data on initial load: ${message.toMap()}');
//       }
//     });

//     // Handle messages when the app is in the background and opened
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Message data on message opened: ${message.toMap()}');
//     });
//     createNotificationChannel();
//   }

//   static Future<void> backgroundHandler(RemoteMessage message) async {
//     // await Firebase.initializeApp();
//     // Handle background message
//     print("Handling a background message: ${message.toMap()}");
//     void d = '';
//     return d;
//   }

//   ///// creating channel
//   static createNotificationChannel() {
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_ecommerce_channel', // id
//       'High Importance Notifications', // title
//       description:
//           'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );

//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();

//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }
// }
