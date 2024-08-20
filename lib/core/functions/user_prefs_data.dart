import 'package:ecommerce2/core/services/services.dart';
import 'package:get/get.dart';

saveUserPrefs(Map<String, dynamic> data) async {
  MyServices myservices = Get.find();
  await myservices.sharedPreferences.setString('userid', "${data['user_id']}");
  await myservices.sharedPreferences.setString('name', data['user_name']);
  await myservices.sharedPreferences.setString('email', data['user_email']);
  await myservices.sharedPreferences.setString('phone', data['user_phone']);
}
