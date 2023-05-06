import 'package:go_router/go_router.dart';

// Import pages
import '../pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase> [
    GoRoute(
      path: '/',
      builder:(context, state) => const HomePage(),
    )
  ],
);
