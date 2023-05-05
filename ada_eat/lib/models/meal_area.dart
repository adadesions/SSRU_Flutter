import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MealArea {
  final String area;

  MealArea({required this.area});

  factory MealArea.fromJson(Map<String, dynamic> json) {
    return MealArea(area: json['strArea']);
  }
}

Future<List<MealArea>?> fetchMealArea() async {
  Uri endpoint =
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list');
  final res = await http.get(endpoint);
  if (res.statusCode == 200) {
    Map<String, dynamic> data = json.decode(res.body);
    List areas = data['meals'];
    return areas.map((a) => MealArea.fromJson(a)).toList();
  } else {
    throw Exception(
        "Error: status code not 200, Status code: ${res.statusCode}");
  }
}
