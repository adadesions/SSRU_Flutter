import 'package:flutter/material.dart';
import '../models/meal.dart';

class RandomMealPage extends StatefulWidget {
  final String area;
  const RandomMealPage({super.key, required this.area});

  @override
  State<StatefulWidget> createState() => _RandomMealPageState();
}

class _RandomMealPageState extends State<RandomMealPage> {
  late Future<Meal> _futureMeal;

  @override
  void initState() {
    super.initState();
    _futureMeal = fetchRandomMealByArea(widget.area);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your meal!'),
      ),
      body: FutureBuilder(
        future: _futureMeal,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Center(
                  child: Column(
                    children: <Widget>[
                      Image.network(snapshot.data!.thumbnail),
                      Text(snapshot.data!.mealName)
                    ],
                  ),
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
