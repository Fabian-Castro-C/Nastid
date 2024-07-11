import 'package:flutter/material.dart';
import './presentation/screens/screens.dart';
import './presentation/theme/light_theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nastid',
      theme: lightTheme,
      home: const Home(),
    );
  }
}