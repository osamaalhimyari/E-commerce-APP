import 'package:ecommerce2/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/items_controller.dart';
import '../../../core/constants/color_app.dart';

class CustomListCategoriesItems extends GetView<ItemsPageControllerImp> {
  const CustomListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItems(
            category: CategoryModel.fromJson(controller.categories[index]),

            index: index, // decoration:
          );
        },
      ),
    );
  }
}

class CategoryItems extends GetView<ItemsPageControllerImp> {
  final CategoryModel category;

  final int index;
  const CategoryItems({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeSelectedCat(index);
      },
      child: GetBuilder<ItemsPageControllerImp>(
        builder: (controller) => Container(
          padding:
              const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
          decoration: controller.selectedCat == index
              ? const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 3, color: AppColors.primaryColor)))
              : null,
          child: Center(
            child: Text(
              "${category.catNameEn}",
              style:
                  // Theme.of(context).textTheme.displaySmall,
                  const TextStyle(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
