import 'package:ecommerce2/core/constants/routes.dart';
import 'package:ecommerce2/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myservices = Get.find();

  @override
  logout() {
    String? userid = myservices.sharedPreferences.getString('userid');
    FirebaseMessaging.instance.unsubscribeFromTopic("news");
    if (userid != null) {
      FirebaseMessaging.instance.unsubscribeFromTopic("userid:$userid");
    }
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.signIn);
  }
}
