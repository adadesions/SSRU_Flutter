import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(titleApp: 'Tue 2 May 2023'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Constructor
  const MyHomePage({super.key, required this.titleApp});

  // Fields
  final String titleApp;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const TextStyle degreeNumberStyle = TextStyle(
        fontSize: 36, fontWeight: FontWeight.w300, color: Colors.white);

    final Shader degreeLinearGradient = const LinearGradient(
      colors: [
        Colors.blue,
        Color.fromARGB(250, 255, 255, 255),
        Color.fromARGB(0, 255, 255, 255),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(const Rect.fromLTWH(0, 0, 0, 300));

    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/cloud_view.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text(
                widget.titleApp,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 11,
                ),
              ),
              backgroundColor: const Color.fromARGB(100, 0, 0, 0),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 400)))),
          body: Container(
            constraints: const BoxConstraints(maxHeight: 250),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("31°",
                        style: TextStyle(
                            fontSize: 180,
                            foreground: Paint()..shader = degreeLinearGradient))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "It's sunny",
                        style: TextStyle(
                            fontSize: 24,
                            foreground: Paint()..shader = degreeLinearGradient),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 60, 0))
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
            constraints: const BoxConstraints(maxHeight: 250),
            decoration: BoxDecoration(
              color: const Color.fromARGB(150, 0, 0, 0),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Weather Today",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 7,
                          color: Colors.white),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Icon(Icons.sunny, size: 36, color: Colors.orange),
                    Icon(Icons.sunny_snowing, size: 36, color: Colors.amber),
                    Icon(Icons.wb_cloudy_outlined,
                        size: 36, color: Colors.blueGrey),
                    Icon(Icons.cloudy_snowing, size: 36, color: Colors.blue),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      "Sunny",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Snowing",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Cloudy",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Rainny",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      "23°",
                      style: degreeNumberStyle,
                    ),
                    Text(
                      "16°",
                      style: degreeNumberStyle,
                    ),
                    Text(
                      "3°",
                      style: degreeNumberStyle,
                    ),
                    Text(
                      "10°",
                      style: degreeNumberStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

// Come back at 10:45
