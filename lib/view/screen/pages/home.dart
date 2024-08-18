import 'package:ecommerce2/app_links.dart';
import 'package:ecommerce2/data/model/item_model.dart';
import 'package:ecommerce2/view/widget/customappbar.dart';
import 'package:ecommerce2/view/widget/home/custom_title_home.dart';
import 'package:ecommerce2/view/widget/home/list_items.dart';

import '../../../controller/pages/home_page_controller.dart';
import '../../widget/home/custom_card.dart';
import '../../widget/home/list_categories.dart';
import '/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                    onPressedIconFavorite: () {},
                    mycontroller: controller.search),
                Center(
                  child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      child:
                          //  !controller.isSearch
                          // ?
                          const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCardHome(
                              title: 'assumer surprise', body: 'Cashback 20%'),
                          CustomTitleHome(title: "Categories"),
                          CustomListCategoriesHome(),
                          CustomTitleHome(title: "Product for you"),
                          CustomListItemsHome(),
                          CustomTitleHome(title: "offer"),
                          CustomListItemsHome(),
                        ],
                      )
                      //     :
                      // ListItemsSearch(
                      //     listdatamodel: controller.items
                      //         .map(
                      //           (e) => ItemModel.fromJson(e),
                      //         )
                      //         .toList())
                      ),
                )
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLinks.imagestItems}/${listdatamodel[index].itemImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemNameEn!),
                          subtitle: Text(listdatamodel[index].catNameEn!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
