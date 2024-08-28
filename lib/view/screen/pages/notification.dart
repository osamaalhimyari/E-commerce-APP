import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/pages/notification_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/color_app.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // NotificationController controller =
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(children: [
                  const Center(
                      child: Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(height: 10),
                  ...List.generate(
                      controller.data.length,
                      (index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Stack(
                              children: [
                                ListTile(
                                  title: Text(controller.data[index]
                                      ['notification_title']),
                                  subtitle: Text(controller.data[index]
                                      ['notification_body']),
                                ),
                                Positioned(
                                    right: 5,
                                    child: Text(
                                      Jiffy.parse(
                                              "${controller.data[index]['notification_datetime']}",
                                              pattern: "yyyy-MM-dd")
                                          .fromNow(),
                                      style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ))
                ]))));
  }
}
