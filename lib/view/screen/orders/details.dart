import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/color_app.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // OrdersDetailsController controller =
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                child: ListView(children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              const TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              // TableRow(children: [
                              //   Text("Macbook m1", textAlign: TextAlign.center),
                              //   Text("2", textAlign: TextAlign.center),
                              //   Text("1200", textAlign: TextAlign.center),
                              // ]),
                              ...List.generate(
                                  controller.data.length,
                                  (index) => TableRow(children: [
                                        Text(
                                            "${controller.data[index].itemNameEn}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].itemscount}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].itemPrice}",
                                            textAlign: TextAlign.center),
                                      ]))
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "Total Price : ${controller.orderModel.orderTotalprice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.orderModel.orderType == 0)
                    Card(
                      child: ListTile(
                        title: const Text("Shipping Address",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "${controller.orderModel.addressCity} ${controller.orderModel.addressStreet}"),
                      ),
                    ),
                  // if (controller.orderModel.orderType == 0)
                  // Card(
                  //   child: Container(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //     height: 300,
                  //     width: double.infinity,
                  //     child: GoogleMap(
                  //       mapType: MapType.normal,
                  //       markers: controller.markers.toSet(),
                  //       initialCameraPosition: controller.cameraPosition!,
                  //       onMapCreated: (GoogleMapController controllermap) {
                  //         controller.completercontroller!
                  //             .complete(controllermap);
                  //       },
                  //     ),
                  //   ),
                  // )
                ])))),
      ),
    );
  }
}
