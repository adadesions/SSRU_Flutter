// packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// pages
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/edit_profile_page.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(title: "Home"),
        routes: <RouteBase>[
          GoRoute(
            path: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: 'editProfile/:username',
            builder: (context, state) => EditProfilePage(
              username: state.pathParameters['username'] ?? "noname",
              saveMethod: state.queryParameters['saveMethod'] ?? "local"
            ),
          ),
        ]),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
