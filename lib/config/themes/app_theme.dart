import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_strings.dart';

abstract class AppTheme{
  static ThemeData lightTheme=ThemeData(
      fontFamily: AppStrings.fontFamily,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      backgroundColor: Colors.red,
      titleTextStyle: const TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontSize: 30
      )
    )
  );





  static ThemeData darkTheme=ThemeData(
      fontFamily: AppStrings.fontFamily,
      appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontSize: 30
          )
      )
  );
}