import 'package:flutter/material.dart';

import '../../constants/color_app.dart';
import '../../constants/fonts_assets.dart';

class EnglishTheme {
  static ThemeData get() {
    return ThemeData(
      fontFamily: FontAsset.playfairDisplay,
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
            color: AppColors.gery,
            fontWeight: FontWeight.bold),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}
