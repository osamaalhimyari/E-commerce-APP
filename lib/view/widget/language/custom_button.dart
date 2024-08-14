import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 2),
        textColor: Colors.white,
        onPressed: onPressed,
        color: AppColors.prymarColor,
        child: Text(textbutton),
      ),
    );
  }
}
