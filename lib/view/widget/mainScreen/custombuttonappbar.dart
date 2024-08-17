import 'package:flutter/material.dart';

import '../../../core/constants/color_app.dart';

class CustomButtonNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonNavBar(
      {super.key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            color: active == true ? AppColors.primaryColor : AppColors.grey2),
        Text(textbutton,
            style: TextStyle(
                color:
                    active == true ? AppColors.primaryColor : AppColors.grey2))
      ]),
    );
  }
}
