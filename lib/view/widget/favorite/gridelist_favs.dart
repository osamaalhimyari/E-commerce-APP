import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/app_links.dart';
import 'package:ecommerce2/controller/pages/myfavorite_controller.dart';
import 'package:ecommerce2/core/constants/color_app.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/myfavorite_model.dart';
// import '../../../controller/pages/favorite_controller.dart';

class GrideViewFavorite extends GetView<MyFavoriteControllerImp> {
  const GrideViewFavorite({super.key});

  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<MyFavoriteControllerImp>(
      builder: (controller) => GridView.builder(
        shrinkWrap: true,
        itemCount: controller.data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          MyFavoriteModel item =
              MyFavoriteModel.fromJson(controller.data[index]);
          return InkWell(
            onTap: () {
              // controller.goToProductDetails(item);
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
                          imageUrl:
                              "${AppLinks.imagestItems}/${item.itemImage}"),
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
                            onPressed: () {
                              controller.deleteFromFavorite("${item.favId}");
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: AppColors.red,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class ItemInFavorite extends GetView<MyFavoriteControllerImp> {
//   final MyFavoriteModel item;
//   // final String isFavorite;
//   const ItemInFavorite({
//     super.key,
//     required this.item,
//     // required this.isFavorite,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // controller.goToProductDetails(item);
//       },
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Hero(
//                 tag: "${item.itemId}",
//                 child: CachedNetworkImage(
//                     imageUrl: "${AppLinks.imagestItems}/${item.itemImage}"),
//               ),
//               Text('${item.itemNameEn}',
//                   style: Theme.of(context).textTheme.bodyLarge),
//               Text("${item.itemDescEn}"),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("${item.itemPrice}\$",
//                       style: const TextStyle(color: AppColors.green)),
//                  IconButton(
//                         onPressed: () {
//                           controller2.deleteFromFavorite("${item.favId}");
//                         },
//                         icon: const Icon(
//                           Icons.delete_outline,
//                           color: AppColors.red,
//                         ));
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
