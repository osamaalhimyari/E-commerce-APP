import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/app_links.dart';
import 'package:ecommerce2/controller/pages/items_controller.dart';
import 'package:ecommerce2/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/items/list_categories.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('item');

    ItemsPageControllerImp controller = Get.put(ItemsPageControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(
                titleappbar: 'items',
                onPressedIconFavorite: () {},
                mycontroller: controller.search),
            const CustomListCategoriesItems(),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  child: CachedNetworkImage(
                      imageUrl: "${AppLinks.imagestItems}/laptop.png"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
