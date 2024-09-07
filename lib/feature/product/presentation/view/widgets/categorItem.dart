import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryIem extends StatelessWidget {
  const CategoryIem({
    super.key,
    this.valu, this.onChanged,
  });
  final String? valu;
 final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: 600,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greylite, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton(
          hint: const Text('category'),
          value: valu,
          items: BlocProvider.of<ProductCubit>(context)
              .category
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
