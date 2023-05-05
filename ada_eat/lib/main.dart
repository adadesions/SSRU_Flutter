import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Pages
import 'pages/home_page.dart';
import 'pages/random_meal_page.dart';

void main() {
  runApp(const App());
}

final GoRouter _routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
            path: 'random_meal',
            builder: (context, state) =>
                RandomMealPage(area: state.queryParameters['area'] ?? 'Thai'))
      ],
    )
  ],
);

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        theme: ThemeData.light(),
        routerConfig: _routes,
      );
}
