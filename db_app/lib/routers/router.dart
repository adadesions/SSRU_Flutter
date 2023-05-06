import 'package:go_router/go_router.dart';

// Import pages
// import '../pages/home_page_local_file.dart'; // For local file
import '../pages/home_page_sqlite.dart'; // For sqlite

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    )
  ],
);
