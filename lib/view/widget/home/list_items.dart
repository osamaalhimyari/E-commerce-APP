import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../app_links.dart';
import '../../../controller/pages/home_page_controller.dart';
import '../../../data/model/item_category.dart';

class CustomListItemsHome extends GetView<HomePageControllerImp> {
  const CustomListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CachedNetworkImage(
            imageUrl: "${AppLinks.imagestItems}/${itemsModel.itemImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          width: 200,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemNameEn}",
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}
