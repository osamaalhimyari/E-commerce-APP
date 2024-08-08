import 'package:flutter/material.dart';

import '../../../core/constants/color_app.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        textColor: Colors.white,
        onPressed: onPressed,
        color: ColorApp.prymarColor,
        child: Text(text),
      ),
    );
  }
}
