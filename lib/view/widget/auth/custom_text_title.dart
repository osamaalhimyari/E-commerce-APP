import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  final String text;
  const CustomTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
