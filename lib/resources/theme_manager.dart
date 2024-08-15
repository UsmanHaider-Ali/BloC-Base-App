import 'package:bloc_base_app/resources/colors_manager.dart';
import 'package:bloc_base_app/resources/values_manager.dart';
import 'package:bloc_base_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static ThemeData get appTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        useMaterial3: true,
        scaffoldBackgroundColor: ColorsManager.screenBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.screenBackgroundColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          // titleTextStyle: Theme.of(Get.context!).textTheme.titleLarge,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: ColorsManager.primaryColor,
            size: 24.adaptSize,
          ),
          iconTheme: IconThemeData(
            color: ColorsManager.primaryColor,
            size: 24.adaptSize,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorsManager.primaryColor,
          selectionColor: ColorsManager.primaryColor,
          selectionHandleColor: ColorsManager.primaryColor,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 18.fSize,
            fontWeight: FontWeight.w600,
            color: ColorsManager.primaryColor,
          ),
          titleMedium: TextStyle(
            fontSize: 16.fSize,
            fontWeight: FontWeight.w500,
            color: ColorsManager.primaryColor,
          ),
          titleSmall: TextStyle(
            fontSize: 14.fSize,
            fontWeight: FontWeight.w500,
            color: ColorsManager.primaryColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 14.fSize,
            fontWeight: FontWeight.normal,
            color: ColorsManager.primaryColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.fSize,
            fontWeight: FontWeight.normal,
            color: ColorsManager.secondaryTextColor,
          ),
          bodySmall: TextStyle(
            fontSize: 14.fSize,
            fontWeight: FontWeight.w300,
            color: ColorsManager.textFormFieldHintColor,
          ),
          labelMedium: TextStyle(
            fontSize: 14.fSize,
            fontWeight: FontWeight.w500,
            color: ColorsManager.buttonTextColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizesManager.buttonTextFieldRadius),
            ),
            disabledBackgroundColor: ColorsManager.primaryColor.withOpacity(0.5),
            disabledForegroundColor: ColorsManager.buttonTextColor.withOpacity(0.5),
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero,
          ),
        ),
      );
}
