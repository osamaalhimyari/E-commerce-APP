import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String lableText;
  final TextInputType? keyboardType;
  final Widget icon;
  final bool obscureText;
  final String? Function(String? val)? validator;
  final TextEditingController controller;
  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.lableText,
      required this.icon,
      required this.controller,
      required this.validator,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
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
            suffixIcon: icon,
            border: OutlineInputBorder(
                gapPadding: 10, borderRadius: BorderRadius.circular(15))),
        validator: validator,
      ),
    );
  }
}
