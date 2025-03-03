import 'package:flutter/material.dart';
import 'package:truetone/core/utiles/app_colors.dart';

class Thems {
  static ThemeData lighttheme() {
    return ThemeData(
      fontFamily: "Roboto",
      scaffoldBackgroundColor: Colors.white,

      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primarycolor,
        onPrimary: AppColors.onprimary,

        error: AppColors.errorcolor,
        onError: AppColors.oneror,
        surface: AppColors.onSurface,
        onSurface: AppColors.onSurface,
        secondary: AppColors.secondry,
        onSecondary: AppColors.onsecondry,
      ),
    );
  }

  static ThemeData darktheme() {
    return ThemeData(
      fontFamily: "Roboto",
      brightness: Brightness.dark,
      //add more
    );
  }
}
