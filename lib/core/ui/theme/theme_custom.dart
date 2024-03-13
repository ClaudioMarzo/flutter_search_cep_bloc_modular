import 'package:bloc_test/core/ui/style/colors_custom.dart';
import 'package:bloc_test/core/ui/style/text_style_custom.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 2,
    ),
  );

  ThemeConfig._();

  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorsCustom.i.white,
    textTheme: TextTheme(
      labelMedium: TextStylesCustom.i.textExtraBold,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStylesCustom.i.textBold.copyWith(fontSize: 30, color: ColorsCustom.i.white),
      backgroundColor: ColorsCustom.i.blue,
      iconTheme: IconThemeData(color: ColorsCustom.i.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsCustom.i.blue,
        foregroundColor: ColorsCustom.i.white,
        textStyle: TextStylesCustom.i.textRegular.copyWith(fontSize: 18, color: ColorsCustom.i.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorsCustom.i.white,
      filled: true,
      isDense: true,
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStylesCustom.i.textRegular.copyWith(color: ColorsCustom.i.black),
      errorStyle: TextStylesCustom.i.textRegular.copyWith(color: ColorsCustom.i.red),
    ),
  );
}
