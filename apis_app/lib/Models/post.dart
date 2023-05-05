import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}

Future<List<Post>?> fetchPosts() async {
  Uri endpoint = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  final response = await http.get(endpoint);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Post.fromJson(data)).toList();
  } else {
    throw Exception(
        "Error: status code not 200, Status code: ${response.statusCode}");
  }
}
