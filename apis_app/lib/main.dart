import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const ApiApp());
}

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<StatefulWidget> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
          appBar: AppBar(
        title: const Text('Api app'),
      )),
    );
  }
}

