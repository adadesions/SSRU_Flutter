import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/meal_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<MealArea>?> _futureMealArea;
  String _selectedArea = '';

  @override
  void initState() {
    super.initState();
    _futureMealArea = fetchMealArea();
    _selectedArea = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ada Eat A-rai !'),
      ),
      body: FutureBuilder(
        future: _futureMealArea,
        builder: (context, snapshot) {          
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Ink(
                      child: ListTile(
                    onTap: () {
                      setState(() {
                        _selectedArea = snapshot.data![index].area;
                      });

                      context.go('/random_meal/?area=$_selectedArea');
                    },
                    title: Text(snapshot.data![index].area),
                  )),
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
