import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/app_links.dart';
import 'package:ecommerce2/core/constants/color_app.dart';
import 'package:ecommerce2/data/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/items_controller.dart';

class GrideViewItem extends GetView<ItemsPageControllerImp> {
  const GrideViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: controller.data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        return ItemInItems(
          item: ItemModel.fromJson(controller.data[index]),
        );
      },
    );
  }
}

class ItemInItems extends GetView<ItemsPageControllerImp> {
  final ItemModel item;
  const ItemInItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(item);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "${item.itemId}",
                child: CachedNetworkImage(
                    imageUrl: "${AppLinks.imagestItems}/${item.itemImage}"),
              ),
              Text('${item.itemNameEn}',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("${item.itemDescEn}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${item.itemPrice}\$",
                      style: const TextStyle(color: AppColors.green)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
