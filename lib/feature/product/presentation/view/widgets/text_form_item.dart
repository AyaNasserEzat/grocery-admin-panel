import 'package:flutter/material.dart';

class TextFormItem extends StatelessWidget {
  const TextFormItem({
    super.key,
    required this.text,
    this.hintText,
    this.initialValue,
    this.onChanged,
     this.controller,
  });
  final String text;
  final String? hintText,initialValue;
  final TextEditingController? controller;
  final  Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue:initialValue ,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
