
import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

//bold style
TextStyle boldStyle({
  Color? color = AppColor.grey,
  double fontSize = 20,
}) =>
    _textStyle(
      color: color!,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
//regular style
TextStyle regularStyle({
  Color color = AppColor.grey,
  double fontSize = 20,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );