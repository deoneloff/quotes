// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

class CustomTheme {
  static ThemeData get appTheme {
    return ThemeData(
      primaryColor: CustomColors.mediumOrange,
      scaffoldBackgroundColor: CustomColors.darkBlue,
      textTheme: TextTheme(
        headlineSmall: const TextStyle(color: Colors.white),
        bodyMedium: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        labelLarge: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.mediumOrange,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: CustomColors.mediumYellow,
        ),
      ),
    );
  }
}
