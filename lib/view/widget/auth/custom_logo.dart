import 'package:ecommerce1/core/constants/image_assets.dart';
import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAsset.logo,
      height: 200,
      width: 200,
    );
  }
}
