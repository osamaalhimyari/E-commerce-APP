import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String lableText;
  final IconData icon;
  final TextEditingController controller;
  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.lableText,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text(lableText)),
              suffixIcon: Icon(icon),
              border: OutlineInputBorder(
                  gapPadding: 10, borderRadius: BorderRadius.circular(15)))),
    );
  }
}
