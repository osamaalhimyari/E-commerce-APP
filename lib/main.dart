import '/core/localization/langs/translation.dart';
import '/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/binding.dart';
import 'core/localization/controller/locale_controller.dart';
import 'core/services/services.dart';

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
    print('main');
    LcaleController controller = Get.put(LcaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      title: 'Flutter Demo',
      theme: controller.getTheme(),
      initialBinding: MyBinding(),
      // home: const OnBoarding(),
      // home: const TestWidget(),

      // routes: routes,
      getPages: routesPages,
    );
  }
}
