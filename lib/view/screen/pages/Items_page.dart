import 'package:ecommerce2/controller/pages/items_controller.dart';
import 'package:ecommerce2/core/class/handlingdataview.dart';
import 'package:ecommerce2/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/items/gridview_items.dart';
import '../../widget/items/list_categories.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsPageControllerImp controller = Get.put(ItemsPageControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(
                titleappbar: 'items',
                onPressedIconFavorite: () {
                  controller.goToFavorite();
                },
                mycontroller: controller.search),
            const CustomListCategoriesItems(),
            GetBuilder<ItemsPageControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    child: const GrideViewItem()))
          ],
        ),
      ),
    );
  }
}
