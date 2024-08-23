import 'package:ecommerce2/data/model/item_model.dart';
import 'package:ecommerce2/view/widget/customappbar.dart';
import 'package:ecommerce2/view/widget/home/custom_title_home.dart';
import 'package:ecommerce2/view/widget/home/list_items.dart';

import '../../../controller/pages/home_page_controller.dart';
import '../../widget/home/custom_card.dart';
import '../../widget/home/list_categories.dart';
import '../../widget/search_item.dart';
import '/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                    titleappbar: 'find product',
                    onPressedIconFavorite: () {
                      controller.goToFavorite();
                    },
                    onChanged: (value) {
                      controller.onSearchchange(value);
                    },
                    onPressedSearch: () {
                      controller.searchData();
                    },
                    mycontroller: controller.search),
                Center(
                  child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      child: !controller.isSearch
                          ? const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCardHome(
                                    title: 'assumer surprise',
                                    body: 'Cashback 20%'),
                                CustomTitleHome(title: "Categories"),
                                CustomListCategoriesHome(),
                                CustomTitleHome(title: "Product for you"),
                                CustomListItemsHome(),
                                CustomTitleHome(title: "offer"),
                                CustomListItemsHome(),
                              ],
                            )
                          : PopScope(
                              canPop: false,
                              onPopInvokedWithResult: (didPop, result) {
                                controller.onGoingBack();
                              },
                              child: ListItemsSearch(
                                  onTap: (item) {
                                    controller.goToPageProductDetails(item);
                                  },
                                  listdatamodel: controller.itemsSearched
                                      .map(
                                        (e) => ItemModel.fromJson(e),
                                      )
                                      .toList()),
                            )),
                )
              ],
            )));
  }
}
