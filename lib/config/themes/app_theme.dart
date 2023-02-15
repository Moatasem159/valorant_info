import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valorant_info/core/utils/app_strings.dart';

abstract class AppTheme{
  static ThemeData lightTheme=ThemeData(
      fontFamily: AppStrings.fontFamily,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light().copyWith(
      background: Colors.white,
    ),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black
      ),
      titleTextStyle: const TextStyle(
        fontFamily: AppStrings.fontFamily,
        color: Colors.black,
        fontSize: 30,
      )
    ),
    textTheme:const TextTheme(
        labelMedium: TextStyle(
          color: Colors.white
        ),
      displayMedium: TextStyle(
          color: Colors.black
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color:Colors.black
    )
  );
  static ThemeData darkTheme=ThemeData(

      fontFamily: AppStrings.fontFamily,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        onBackground: Colors.black,
        background: Colors.black,
      ),
      appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        iconTheme: const IconThemeData(
              color: Colors.white
  ),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              color: Colors.white,
              fontSize: 30
          )
      ),
   textTheme:const TextTheme(
     labelMedium: TextStyle(
       color: Colors.black,
     ),
     displayMedium: TextStyle(
         color: Colors.white
     ),
   ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
          color:Colors.white
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