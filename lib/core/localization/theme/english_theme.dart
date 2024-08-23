import 'package:flutter/material.dart';

import '../../constants/color_app.dart';
import '../../constants/fonts_assets.dart';

class EnglishTheme {
  static ThemeData get() {
    return ThemeData(
      fontFamily: AppFontAsset.playfairDisplay,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        titleTextStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: AppFontAsset.playfairDisplay,
            fontSize: 25),
        backgroundColor: Colors.grey[50],
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
        bodyMedium: TextStyle(
          height: 2,
          fontSize: 17,
          color: AppColors.gery,
        ),
        bodyLarge: TextStyle(
            height: 2,
            fontSize: 20,
            // fontFamily: ,
            color: AppColors.gery,
            fontWeight: FontWeight.bold),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // useMaterial3: true,
    );
  }
}
