import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_colors.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/core/utils/font_size.dart';
abstract class AppTheme{
  static ThemeData lightTheme=ThemeData(
    iconTheme: const IconThemeData(
      color: AppColors.primaryLightColor,
    ),
      fontFamily: AppStrings.fontFamily,
      primaryColor: AppColors.primaryLightColor,
      primaryColorLight: AppColors.primaryLightColor,
      primaryColorDark: AppColors.primaryLightWhiteColor,
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColors.primaryLightWhiteColor,
    ),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      elevation:0,
      backgroundColor:AppColors.primaryLightWhiteColor,
      iconTheme: const IconThemeData(
        color: AppColors.primaryLightColor,
      ),
      titleTextStyle: const TextStyle(
        fontFamily: AppStrings.fontFamily,
        color: AppColors.primaryLightColor,
        fontSize: FontSize.s24
      )
    ),
    textTheme:const TextTheme(
        labelMedium: TextStyle(
          color: AppColors.primaryLightWhiteColor
        ),
        labelLarge: TextStyle(
          color: AppColors.primaryLightColor,
        ),
      displayMedium: TextStyle(
          color: AppColors.primaryLightColor,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color:AppColors.primaryLightColor,
    )
  );
  static ThemeData darkTheme=ThemeData(
      iconTheme: const IconThemeData(
        color: AppColors.primaryDarkColor,
      ),
      fontFamily: AppStrings.fontFamily,
      primaryColor: Colors.white12,
      primaryColorLight: AppColors.primaryDarkColor,
      primaryColorDark: AppColors.primaryDarkBlackColor,
      colorScheme: const ColorScheme.light().copyWith(
        background: AppColors.primaryDarkBlackColor,
      ),
      appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        elevation: 0,
        iconTheme: const IconThemeData(
              color: AppColors.primaryDarkColor
  ),
        backgroundColor:AppColors.primaryDarkBlackColor,
        titleTextStyle: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              color: AppColors.primaryDarkColor,
              fontSize: FontSize.s24
          )
      ),
   textTheme:const TextTheme(
     labelMedium: TextStyle(
       color: AppColors.primaryDarkBlackColor,
     ),
     labelLarge: TextStyle(
         color: AppColors.primaryDarkColor
     ),
     displayMedium: TextStyle(
         color: AppColors.primaryDarkColor
     ),
   ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
          color:AppColors.primaryDarkColor
  )
  );
}