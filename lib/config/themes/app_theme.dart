import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valorant_info/core/utils/app_strings.dart';

abstract class AppTheme{
  static ThemeData lightTheme=ThemeData(
      fontFamily: AppStrings.fontFamily,
    colorScheme: const ColorScheme.light().copyWith(
      background: Colors.white,
    ),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        fontFamily: AppStrings.fontFamily,
        color: Colors.black,
        fontSize: 30,
      )
    )
  );
  static ThemeData darkTheme=ThemeData(
      fontFamily: AppStrings.fontFamily,
      colorScheme: const ColorScheme.light().copyWith(
        onBackground: Colors.black,
        background: Colors.black,
      ),
      appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              color: Colors.white,
              fontSize: 30
          )
      )
  );
}

changeStatusBar(bool light){
  if(light)
  {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
    ));
  }
  if(!light)
    {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
      ));
    }

}