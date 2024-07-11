import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(

  routes: [

    GoRoute(
      path: '/',
      builder : (context, state) => const Home(),
    ),

    GoRoute(
      path: '/identifier',
      builder : (context, state) {
        // Se extrae el path de la carpeta de imágenes
        final pathImagesFolder = state.extra as String;
        return IdentifierScreen(pathImagesFolder: pathImagesFolder);
      },
    ),
    
  ],
);
