import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/checkout_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/color_app.dart';
import '../../../core/constants/image_assets.dart';
import '../../widget/checkout/carddeliveerytype.dart';
import '../../widget/checkout/cardpaymentmethod.dart';
import '../../widget/checkout/cardshippingaddress.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColors.secondaryColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text(
                        "Choose Payment Method",
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod(0);
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Cash On Delivery",
                            isActive: controller.paymentMethod == 0 // cash
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod(1);
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Payment Cards",
                            isActive: controller.paymentMethod == 1 // Card
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Choose Delivery Type",
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType(0); // 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.deliveryImage2,
                                title: "Delivery",
                                active: controller.deliveryType == 0
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType(1); // 1 => recive
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.drivethruImage,
                                title: "Revice",
                                active: controller.deliveryType == 1
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 20),
                      if (controller.deliveryType == 0)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      controller.dataaddress[index].addressId ??
                                          0);
                                },
                                child: CardShppingAddressCheckout(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  )))),
    );
  }
}
