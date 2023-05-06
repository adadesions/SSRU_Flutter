import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'routers/router.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: router,
      );
}
