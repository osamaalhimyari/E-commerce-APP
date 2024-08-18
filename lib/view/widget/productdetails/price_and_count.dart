import 'package:ecommerce2/controller/pages/product_details_controller.dart';
import 'package:ecommerce2/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceAndCountItems extends GetView<ProductDetailsControllerImp> {
  // final void Function()? onAdd;
  // final void Function()? onRemove;
  // final String price;
  // final String count;
  const PriceAndCountItems({
    super.key,
    // required this.onAdd,
    // required this.onRemove,
    // required this.price,
    // required this.count
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  controller.onAdd();
                },
                icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  "${controller.itemsModel.itemCount}",
                  style: const TextStyle(fontSize: 20, height: 1.1),
                )),
            IconButton(
                onPressed: () {
                  controller.onRemove();
                },
                icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "${controller.itemsModel.itemPrice} \$",
          style: const TextStyle(
              color: AppColors.primaryColor, fontSize: 30, height: 1.1),
        )
      ],
    );
  }
}
