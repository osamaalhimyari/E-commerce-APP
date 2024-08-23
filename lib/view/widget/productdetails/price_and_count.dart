import 'package:ecommerce2/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onDelete;
  final String price;
  final String count;
  const PriceAndCountItems(
      {super.key,
      required this.onAdd,
      required this.onDelete,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  count,
                  style: const TextStyle(fontSize: 20, height: 1.1),
                )),
            IconButton(onPressed: onDelete, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
              color: AppColors.primaryColor, fontSize: 30, height: 1.1),
        )
      ],
    );
  }
}
