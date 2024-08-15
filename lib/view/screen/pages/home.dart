// import 'package:cached_network_image/cached_network_image.dart';
// import '/controller/home_controller.dart';
// import '/core/class/handlingdataview.dart';
// import '/core/constant/routes.dart';
// import '/data/model/itemsmodel.dart';
// import '/linkapi.dart';
// import '/view/widget/customappbar.dart';
// import '/view/widget/home/customcardhome.dart';
// import '/view/widget/home/customtitlehome.dart';
// import '/view/widget/home/listcategorieshome.dart';
// import '/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/home_page_controller.dart';
import '../../widget/customappbar.dart';

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
                  mycontroller: controller.search,
                  titleappbar: "Find Product",
                  // onPressedIcon: () {},
                  onPressedSearch: () {
                    // controller.onSearchItems();
                  },
                  onChanged: (val) {
                    // controller.checkSearch(val);
                  },
                  onPressedIconFavorite: () {
                    // Get.toNamed(AppRoute.myfavroite);
                  },
                ),
                // HandlingDataView(
                //     statusRequest: controller.statusRequest,
                //     child: !controller.isSearch
                //         ? Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: const [
                //               // CustomCardHome(
                //               //     title: "A summer surprise",
                //               //     body: "Cashback 20%"),
                //               // CustomTitleHome(title: "Categories"),
                //               // ListCategoriesHome(),
                //               // CustomTitleHome(title: "Product for you"),
                //               // ListItemsHome(),
                //             ],
                //           )
                //         : ListItemsSearch(listdatamodel: controller.listdata))

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome()
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  // final List<ItemsModel> listdatamodel;
  final listdatamodel;
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
                    // Expanded(
                    //     child: CachedNetworkImage(
                    //         imageUrl:
                    //             "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
