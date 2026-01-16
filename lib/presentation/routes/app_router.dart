import 'package:flutter_health_care/presentation/routes/route_paths.dart';
import 'package:go_router/go_router.dart';

import '../auth/src.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.register, // RoutePaths.splash,
  routes: [
    // GoRoute(
    //   path: RoutePaths.splash,
    //   builder: (context, state) => const SplashPage(),
    // )
    GoRoute(
      path: RoutePaths.register,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
