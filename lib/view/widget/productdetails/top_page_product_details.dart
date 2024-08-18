import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/controller/pages/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_links.dart';
import '../../../core/constants/color_app.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColors.secondaryColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.itemId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLinks.imagestItems}/${controller.itemsModel.itemImage!}",
                height: 250,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
