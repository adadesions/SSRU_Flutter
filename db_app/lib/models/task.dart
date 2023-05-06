import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';

class Task {
  String task;
  String dueDate;

  Task({required this.task, required this.dueDate});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(task: json['task'], dueDate: json['dueDate']);
  }

  static Future<List<Task>> readFile(String filePath) async {
    final jsonString = await rootBundle.loadString(filePath);
    final jsonList = json.decode(jsonString) as List<dynamic>;

    return jsonList.map((data) => Task.fromJson(data)).toList();
  }

  
}
