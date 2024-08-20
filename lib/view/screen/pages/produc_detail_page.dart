import 'package:ecommerce2/controller/pages/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/color_app.dart';
import '../../widget/productdetails/price_and_count.dart';
import '../../widget/productdetails/sub_items_list.dart';
import '../../widget/productdetails/top_page_product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductDetailsControllerImp controller =
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColors.secondaryColor,
                onPressed: () {
                  // Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${controller.itemsModel.itemNameEn}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          // color: AppColors.fourthColor,
                                          )),
                              const SizedBox(height: 10),
                              const PriceAndCountItems(
                                  // onAdd: () {
                                  //   controller.add();
                                  // },
                                  // onRemove: () {
                                  //   controller.remove();
                                  // },
                                  // price:
                                  //     "${controller.itemsModel.itemsPriceDiscount}",
                                  // count: "${controller.countitems}"
                                  ),
                              const SizedBox(height: 10),
                              Text("${controller.itemsModel.itemDescEn}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.grey2)),
                              const SizedBox(height: 10),
                              Text("Color",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        color: AppColors.secondaryColor,
                                      )),
                              const SizedBox(height: 10),
                              const SubitemsList()
                            ]),
                      ))
                ])));
  }
}
