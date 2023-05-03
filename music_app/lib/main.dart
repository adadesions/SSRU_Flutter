import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Pages
import 'pages/album_page.dart';
import 'pages/songlist_page.dart';
import 'pages/song_page.dart';

void main() {
  runApp(const MusicApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase> [
    GoRoute(path: '/', builder: (context, state) => const AlbumPage()),
  ],
);

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<StatefulWidget> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData.dark(),
    );
  }
}
