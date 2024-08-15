import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/json_image_assets.dart';

class SharedLoading extends StatelessWidget {
  const SharedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Lottie.asset(AppJasonImageAsset.loading, width: 100, height: 100));
  }
}
