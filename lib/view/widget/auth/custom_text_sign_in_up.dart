import 'package:flutter/material.dart';

import '../../../core/constants/color_app.dart';

class CustomTextSignInUp extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;
  const CustomTextSignInUp(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
            onTap: onTap,
            child: Text(
              text2,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.primaryColor),
            )),
      ],
    );
  }
}
