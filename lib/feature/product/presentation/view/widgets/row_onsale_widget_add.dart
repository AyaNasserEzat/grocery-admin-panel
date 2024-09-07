import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class RowOnSaleWidget extends StatelessWidget {
  const RowOnSaleWidget({
    super.key,
    this.value,
    this.onChanged,
  });
  final bool? value;
  final void Function(bool? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'is on sale',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Checkbox(
          activeColor: AppColor.green,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
