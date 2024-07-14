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
        return const IdentifierScreen();
      },
    ),
    
  ],
);
