import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/orders/orderslistcard.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersList(listdata: controller.data[index])),
                  )))),
        ));
  }
}
