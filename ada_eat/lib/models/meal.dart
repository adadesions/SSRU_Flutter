import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Meal {
  final String mealName;
  final String thumbnail;

  Meal({required this.mealName, required this.thumbnail});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(mealName: json['strMeal'], thumbnail: json['strMealThumb']);
  }
}

Future<Meal> fetchRandomMealByArea(String area) async {
  Uri api =
      Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?a=$area');
  final res = await http.get(api);

  if (res.statusCode == 200) {
    List meals = json.decode(res.body)['meals'];
    Random rand = Random();
    int randIdx = rand.nextInt(meals.length);
    return Meal.fromJson(meals[randIdx]);
  } else {
    throw Exception(
        "Error: status code not 200, Status code: ${res.statusCode}");
  }
}
