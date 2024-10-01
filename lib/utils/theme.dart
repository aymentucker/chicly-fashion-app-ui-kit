import 'package:chicly/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: MyColors.primaryColor,
      secondary: MyColors.secondaryColor,
    ),
    textTheme: TextTheme(
      displayLarge:
          GoogleFonts.tajawal(fontSize: 22, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.tajawal(fontSize: 14),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.primaryColor,
      titleTextStyle: GoogleFonts.tajawal(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.primaryColor, width: 2),
      ),
      prefixIconColor: MyColors.primaryColor,
      suffixIconColor: MyColors.primaryColor,
      hintStyle: GoogleFonts.tajawal(color: Colors.grey),
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: MyColors.primaryDarkColor,
      secondary: MyColors.secondaryDarkColor,
    ),
    scaffoldBackgroundColor: MyColors.primaryDarkColor,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.tajawal(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: GoogleFonts.tajawal(fontSize: 14, color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.primaryDarkColor,
      titleTextStyle: GoogleFonts.tajawal(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFF424242), // Darker color for the dark theme
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.primaryDarkColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyColors.primaryDarkColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            const BorderSide(color: MyColors.primaryDarkColor, width: 2),
      ),
      prefixIconColor: MyColors.primaryDarkColor,
      suffixIconColor: MyColors.primaryDarkColor,
      hintStyle: GoogleFonts.tajawal(color: Colors.grey[300]),
    ),
    useMaterial3: true,
  );
}
