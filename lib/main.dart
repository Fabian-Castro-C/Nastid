import 'package:flutter/material.dart';
import 'config/theme/light_theme/light_theme.dart';
import './config/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './presentation/blocs/blocs.dart';
import './domain/matrix_repository.dart';
import './domain/matrix_api_service.dart';


void main() {
  final MatrixRepository repository = MatrixRepository(
    apiService: MatrixApiService(baseUrl: 'http://127.0.0.1:8000'),
  );

  runApp(BlocsProviders(repository: repository,));
}

class BlocsProviders extends StatelessWidget{ 
  final MatrixRepository repository;
  const BlocsProviders({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FileSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => MatrixCubit(repository: repository),
        )
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



