import 'package:go_router/go_router.dart';

// TODO: Import pages

final GoRouter router = GoRouter(
  routes: <RouteBase> [
    GoRoute(
      path: '/',
      builder:(context, state) => const HomePage(),
    )
  ],
);
