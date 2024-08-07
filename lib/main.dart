import 'package:ecommerce1/core/constants/fonts_assets.dart';
import 'package:ecommerce1/core/localization/translation.dart';
import 'package:ecommerce1/routes.dart';
import 'package:ecommerce1/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/color_app.dart';
import 'core/localization/controller/lang_controller.dart';
import 'core/services/services.dart';
import 'view/screen/language.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LcaleController controller = Get.put(LcaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: FontAsset.playfairDisplay),
          bodyLarge: TextStyle(
              height: 2,
              fontSize: 17,
              color: ColorApp.gery,
              fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialBinding: ,
      // home: const OnBoarding(),
      home: const Language(),
      routes: routes,
    );
  }
}
