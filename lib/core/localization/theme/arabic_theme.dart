import 'package:flutter/material.dart';

import '../../constants/color_app.dart';
import '../../constants/fonts_assets.dart';

class ArabicTheme {
  static ThemeData get() {
    return ThemeData(
      fontFamily: FontAsset.cairo,
      textTheme: const TextTheme(
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
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 62, 183, 58)),
      useMaterial3: true,
    );
  }
}
