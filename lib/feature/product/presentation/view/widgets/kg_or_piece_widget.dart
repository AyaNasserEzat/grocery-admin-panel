import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
class KgOrPeiceWidget extends StatelessWidget {
  const KgOrPeiceWidget({
    super.key,
    this.groupValue,
    this.onChanged,
  });
  final String? groupValue;
  final void Function(String? valu)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'KG',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Radio(
          activeColor: AppColor.green,
          value: 'KG',
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          'Peice',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          width: 5,
        ),
        Radio(
          activeColor: AppColor.green,
          value: 'peice',
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
