import 'dart:io';

import '/core/localization/langs/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  return Get.defaultDialog(
      title: Translate.warning,
      middleText: Translate.alertexitingApp,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text(Translate.yes)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(Translate.cancel)),
      ]);

  // return Future.value(true);
}
