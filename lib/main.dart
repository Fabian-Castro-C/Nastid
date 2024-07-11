import 'package:flutter/material.dart';
import './presentation/theme/light_theme/light_theme.dart';
import './config/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nastid',
      theme: lightTheme,
      routerConfig: appRouter,
    );
  }
}



