import 'package:ecommerce2/controller/pages/home_page_controller.dart';
import 'package:ecommerce2/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app_links.dart';
import '../../../core/constants/color_app.dart';

class CustomListCategoriesHome extends GetView<HomePageControllerImp> {
  const CustomListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryHome(
            category: CategoryModel.fromJson(controller.categories[index]),
            onTap: () {
              controller.goToItems(index);
            },
          );
        },
      ),
    );
  }
}

class CategoryHome extends StatelessWidget {
  final CategoryModel category;
  final Function() onTap;
  const CategoryHome({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLinks.imagestCategories}/${category.catImage}",
            ),
          ),
          Text(
            "${category.catNameEn}",
            style: const TextStyle(fontSize: 13, color: AppColors.black),
          )
        ],
      ),
    );
  }
}
