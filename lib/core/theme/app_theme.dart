import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/core/theme/app_style.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: AppColor.white,
      //scaffoldBackgroundColor
      scaffoldBackgroundColor: AppColor.white,
      //appBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.white,
      ),
      //text theme
      textTheme: TextTheme(
        displayLarge: regularStyle(),
        displayMedium: regularStyle(),
      ),
      //button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      //text field
      inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColor.greylite)),
        //fouced border
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColor.green)),
        //error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        //hint
        hintStyle: regularStyle(color: AppColor.grey, fontSize: 15),
        //fill color
        fillColor: Colors.white,
        filled: true,
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(
            AppColor.green,
          ),
          backgroundColor:WidgetStatePropertyAll(
            AppColor.white,
          ) ,
        ),
      ));
}
