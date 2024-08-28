import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../core/constants/color_app.dart';
import '../../../core/constants/routes.dart';
import '../../../data/model/order_model.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrderModel listdata;

  const CardOrdersListArchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.orderId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy.parse(listdata.orderDate!, pattern: "yyyy-MM-dd")
                        .fromNow(),
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.orderType!)}"),
              Text("Order Price : ${listdata.orderPrice} \$"),
              Text("Delivery Price : ${listdata.orderDeliveryprice} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.orderPaymethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.orderState!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.orderId} \$ ",
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColors.thirdColor,
                    textColor: AppColors.secondaryColor,
                    child: const Text("Details"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
