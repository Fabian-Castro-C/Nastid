import 'package:flutter/material.dart';
import './light_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

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

  // Define TextTheme
  textTheme: lightTextTheme,

  // Se usa tema de google

  // Define FontFamily
  fontFamily: GoogleFonts.roboto().fontFamily,

);