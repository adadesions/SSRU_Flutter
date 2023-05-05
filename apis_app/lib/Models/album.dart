import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }
}

// Fetching
Future<List<Album>?> fetchAlbums() async {
  Uri endpoint = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  final response = await http.get(endpoint);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Album.fromJson(data)).toList();
  } else {
    throw Exception(
        "Error: status code not 200, Status code: ${response.statusCode}");
  }
}

// Fetching for development purpose
Future<void> fetchData() async {
  Uri endpoint = Uri.parse('https://dog.ceo/api/breeds/image/random');
  final res = await http.get(endpoint);

  if (res.statusCode == 200) {
    final Map<String, dynamic> jsonRes = jsonDecode(res.body);
    print(jsonRes);
  } else {
    throw Exception(
        "Error: status code not 200, Status code: ${res.statusCode}");
  }
}
