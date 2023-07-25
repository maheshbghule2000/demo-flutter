import 'package:flutter/material.dart';

import '../consts/app_colors.dart';

class AppTheme {
  static ThemeData get chambrayTheme {
    return ThemeData(
      primaryColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.bodyColor,
    );
  }
}
