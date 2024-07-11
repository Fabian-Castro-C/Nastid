import 'package:flutter/material.dart';

// Define light theme
final ThemeData lightTheme = ThemeData(
  // Define primary swatch
  primarySwatch: Colors.blue,

  // Define AppBar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),

    // Define text style for AppBar title
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      ),
  ),
  
);