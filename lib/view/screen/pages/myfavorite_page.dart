import 'package:ecommerce2/view/widget/favorite/gridelist_favs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/myfavorite_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/customappbar.dart';

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavoriteControllerImp controller = Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(
                titleappbar: 'items',
                onPressedIconFavorite: () {},
                mycontroller: controller.search),
            GetBuilder<MyFavoriteControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    child: const GrideViewFavorite()))
          ],
        ),
      ),
    );
    ;
  }
}
