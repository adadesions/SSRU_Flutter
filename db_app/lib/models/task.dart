import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Task {
  String task;
  String dueDate;

  Task({required this.task, required this.dueDate});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(task: json['task'], dueDate: json['dueDate']);
  }

  Map<String, dynamic> toJson() {
    return {'task': task, 'dueDate': dueDate};
  }

  static Future<List<Task>> readFile(String filePath) async {
    final jsonString = await rootBundle.loadString(filePath);
    final jsonList = json.decode(jsonString) as List<dynamic>;

    return jsonList.map((data) => Task.fromJson(data)).toList();
  }

  static void writeFile(
      List<Task> taskList, String filePath, bool isProd) async {
    final jsonString =
        json.encode(taskList.map((task) => task.toJson()).toList());

    // For Development
    String absolutePath = '/Users/adax/Github/SSRU_Flutter/db_app/$filePath';

    // For Production
    Directory tempDir = await getTemporaryDirectory();
    String dirPath = tempDir.path;

    if (isProd) {
      absolutePath = '$dirPath/$filePath';
    }

    final file = File(absolutePath);
    if (await file.exists()) {
      await file.writeAsString(jsonString);
    } else {
      print('File does not exist');
    }
  }
}
