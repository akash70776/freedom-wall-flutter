import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF1F5E3B);
  static const Color softGreen = Color(0xFF4F8F6A);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      primary: primaryGreen,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(color: primaryGreen),
      titleTextStyle: TextStyle(
        color: primaryGreen,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryGreen,
      foregroundColor: Colors.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, height: 1.6),
      bodyMedium: TextStyle(fontSize: 14, height: 1.5),
      labelLarge: TextStyle(fontWeight: FontWeight.w600),
    ),
  );
}
