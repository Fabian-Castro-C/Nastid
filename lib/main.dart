import 'package:flutter/material.dart';
import 'config/theme/light_theme/light_theme.dart';
import './config/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './presentation/blocs/blocs.dart';

void main() {
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget{ 
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FileSelectionCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
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



