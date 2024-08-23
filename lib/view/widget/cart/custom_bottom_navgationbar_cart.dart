// ignore_for_file: avoid_unnecessary_containers

import 'package:ecommerce2/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/cart_controller.dart';
import 'buttoncart.dart';
import 'custombuttoncoupon.dart';

class BottomNavgationBarCart extends GetView<CartControllerImp> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartControllerImp>(
            builder: (controller) => controller.couponModel == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                hintText: "Coupon Code",
                                border: OutlineInputBorder()),
                          )),
                      const SizedBox(width: 5),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: "apply",
                            onPressed: onApplyCoupon,
                          ))
                    ]))
                // ignore: dead_code
                : Container(
                    child: Text(
                    "Coupon Code: ${controller.couponModel!.couponName}",
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ))),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("price", style: TextStyle(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        Text("$price \$", style: const TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        const Text("discount", style: TextStyle(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$discount ",
                        style: const TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        const Text("shipping", style: TextStyle(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$shipping ",
                        style: const TextStyle(fontSize: 16)))
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("Total Price",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalprice \$",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor)))
              ],
            ),
          ]),
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Order",
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    ));
  }
}
