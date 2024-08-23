import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/cart_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/cart/custom_bottom_navgationbar_cart.dart';
import '../../widget/cart/customitemscartlist.dart';
import '../../widget/cart/topcardcart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartControllerImp>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                controllercoupon: controller.controllercoupon,
                onApplyCoupon: () {
                  controller.checkcoupon();
                },
                price: "${cartController.priceorders}",
                discount:
                    "${controller.couponDiscount()}%", // "${controller.discountcoupon}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartControllerImp>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${cartController.totalcountitems} Item in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController.add(
                                      "${cartController.data[index].itemId}");
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.delete(
                                      "${cartController.data[index].itemId}");
                                  cartController.refreshPage();
                                },
                                imagename:
                                    "${cartController.data[index].itemImage}",
                                name:
                                    "${cartController.data[index].itemNameEn}",
                                price:
                                    "${cartController.data[index].itemPrice} \$",
                                count:
                                    "${cartController.data[index].itemscount}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
