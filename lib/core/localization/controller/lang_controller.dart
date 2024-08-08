import 'dart:ui';

import 'package:ecommerce1/core/services/services.dart';
import 'package:get/get.dart';

class LcaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  changeLocale(Locale locale) {
    language = locale;
    myServices.sharedPreferences
        .setString('lang', '${locale.languageCode}_${locale.countryCode}');
    Get.updateLocale(locale);
  }

  translate(String text) {
    return Get
        .translations[language!.toLanguageTag().replaceAll('-', '_')]![text];
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == null) {
      language = Get.deviceLocale ?? Locale('en', 'us');
    } else {
      language =
          Locale(sharedPrefLang.split('_')[0], sharedPrefLang.split('_')[1]);
    }
    super.onInit();
  }
}
