import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/constants/color_app.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textbutton;
  final Function()? onPressed;
  const CustomButtonLanguage(
      {super.key, required this.textbutton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        textColor: Colors.white,
        onPressed: onPressed,
        color: ColorApp.prymarColor,
        child: Text(textbutton),
      ),
    );
  }
}
