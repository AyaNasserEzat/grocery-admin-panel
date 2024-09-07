import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedSwitcherWidget extends StatelessWidget {
  const AnimatedSwitcherWidget({
    super.key,
    this.value,
    this.onChanged,
    this.text, this.hint,
  });
  final String? hint,value;
  final double? text;
  final void Function(String? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: Row(
          children: [
            DropdownButtonHideUnderline(
              child: Container(
                width: 150,
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greylite, width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                    hint:  Text(hint!),
                    value: value,
                    items: BlocProvider.of<ProductCubit>(context)
                        .salePrecentList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: onChanged),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: Text(text.toString())),
          ],
        ));
  }
}
