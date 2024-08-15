import '/core/localization/theme/arabic_theme.dart';
import '/core/localization/theme/english_theme.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static Map<String, ThemeData> get themeskeys => {
        "ar_ar": ArabicTheme.get(),
        "en_us": EnglishTheme.get(),
      };
}
