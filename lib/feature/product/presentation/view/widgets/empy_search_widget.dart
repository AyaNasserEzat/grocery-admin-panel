import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'no such product found try again',
          style: TextStyle(color: AppColor.green, fontSize: 25),
        ),
      ],
    );
  }
}
