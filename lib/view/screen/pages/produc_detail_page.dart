import 'package:ecommerce2/controller/pages/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/productdetails/price_and_count.dart';
import '../../widget/productdetails/top_page_product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductDetailsControllerImp controller =
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body: Container(
        child: ListView(
          children: const [
            TopProductPageDetails(),
            SizedBox(
              height: 120,
            ),
            PriceAndCountItems()
          ],
        ),
      ),
    );
  }
}
