import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    // Define the default brightness and colors
    brightness: Brightness.light, // Light purple
    primaryColor: Color.fromARGB(255, 61, 23, 122), // Dark purple
    hintColor: Color(0xFFB88DCE), // Medium purple

    // Define the default font family
    fontFamily: 'Roboto',

    // Define the default TextTheme
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 61, 23, 122)), // Dark purple
      bodyLarge: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 61, 23, 122)), // Dark purple
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 206, 183, 230)), // Light purple
    ),

    // Define Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Color(0xFFB88DCE)), // Medium purple
        foregroundColor: WidgetStateProperty.all(Color(0xFFE5D9F2)), // Light purple
      ),
    ),

    // Define AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFE5D9F2), // Light purple
      titleTextStyle: TextStyle(
        color: Color(0xFF6D28D9), // Dark purple
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Define FloatingActionButton theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 180, 136, 201), // Medium purple
      foregroundColor: Color.fromARGB(255, 221, 197, 248), // Light purple
    ),

    // Define Switch theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Color(0xFFB88DCE)), // Medium purple
    ), 
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    // Define the default brightness and colors
    brightness: Brightness.dark, // Dark purple
    primaryColor: Color(0xFF4B2D77), // Medium dark purple
    hintColor: Color.fromARGB(255, 237, 206, 254), // Light purple

    // Define the default font family
    fontFamily: 'Roboto',

    // Define the default TextTheme
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 237, 206, 254)), // Light purple
      bodyLarge: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 237, 206, 254)), // Light purple
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF1E1B29)), // Dark purple
    ),

    // Define Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Color(0xFF4B2D77)), // Medium dark purple
        foregroundColor: WidgetStateProperty.all(Color.fromARGB(255, 237, 206, 254)), // Light purple
      ),
    ),

    // Define AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E1B29), // Dark purple
      titleTextStyle: TextStyle(
        color: Color.fromARGB(255, 237, 206, 254), // Light purple
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Define FloatingActionButton theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF4B2D77), // Medium dark purple
      foregroundColor: Color.fromARGB(255, 237, 206, 254), // Light purple
    ),

    // Define Switch theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Color(0xFF4B2D77)), // Medium dark purple
    ), 
  );
}
