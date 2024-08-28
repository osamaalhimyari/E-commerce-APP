import 'package:ecommerce2/core/constants/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../controller/orders/pending_controller.dart';

requestPermissionNotification() async {
  // NotificationSettings settings =
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });

  // FirebaseMessaging.onBackgroundMessage(
  //   (message) {
  //     return backgroundHandler(message);
  //   },
  // );
}

refreshPageNotification(data) {
  // print("============================= page id ");
  // print(data['pageid']);
  // print("============================= page name ");
  // print(data['pagename']);
  // print("================== Current Route");
  // print(Get.currentRoute);

  if (Get.currentRoute == AppRoute.orderspending &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.refrehOrder();
  }
}

/////////
Future<void> backgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  // Handle background message
  // print("Handling a background message: ${message.toMap()}");
  void d = '';
  return d;
}

// Firebase + stream 
// Socket io 
// Notification refresh 