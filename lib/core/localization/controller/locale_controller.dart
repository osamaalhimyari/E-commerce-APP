import 'package:ecommerce2/core/functions/creat_channel_notification.dart';

import '../../functions/fcmconfig.dart';
import '/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/themes.dart';

class LcaleController extends GetxController {
  Locale? language;
  ThemeData? appTheme;
  MyServices myServices = Get.find();
  changeLocale(Locale locale) {
    language = locale;
    myServices.sharedPreferences
        .setString('lang', '${locale.languageCode}_${locale.countryCode}');
    appTheme =
        MyThemes.themeskeys[language!.toLanguageTag().replaceAll('-', '_')];

    Get.updateLocale(locale);
  }

  translate(String text) {
    return Get
        .translations[language!.toLanguageTag().replaceAll('-', '_')]![text];
  }

  getTheme() {
    return MyThemes.themeskeys[language!.toLanguageTag().replaceAll('-', '_')];
  }

  @override
  void onInit() {
    requestPermissionNotification();

    fcmconfig();
    createNotificationChannel();
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == null) {
      language = Get.deviceLocale ?? const Locale('en', 'us');
    } else {
      language =
          Locale(sharedPrefLang.split('_')[0], sharedPrefLang.split('_')[1]);
    }
    appTheme =
        MyThemes.themeskeys[language!.toLanguageTag().replaceAll('-', '_')];
    super.onInit();
  }
}
