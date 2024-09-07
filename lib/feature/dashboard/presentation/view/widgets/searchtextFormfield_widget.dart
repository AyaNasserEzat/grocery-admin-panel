import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidgets extends StatelessWidget {
  const SearchTextFieldWidgets({
    super.key,
    this.onChanged, this.controller,
  });
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search",
          fillColor: Colors.green[100],
          filled: true,
          suffixIcon: const Icon(
            Icons.search,
            size: 25,
            color: AppColor.green,
          ),
        ),
      ),
    );
  }
}
