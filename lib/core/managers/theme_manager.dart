

import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/color_manager.dart';


class ThemeManager{


  static ThemeData  theme() {

    return ThemeData(
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.background,
    appBarTheme:const AppBarTheme(
      backgroundColor: ColorManager.background,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
        fontSize: 70,
        color: ColorManager.whiteColor
      ),
      bodyMedium:const TextStyle(
          fontSize: 12,
          color: ColorManager.whiteColor
      ),
      bodySmall:TextStyle(
          fontSize:10,
          color: ColorManager.whiteColor.withOpacity(0.7)
      ) ,
    )
  );
  }
}