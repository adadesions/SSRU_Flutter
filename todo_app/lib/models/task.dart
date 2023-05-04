import 'package:flutter/material.dart';

class Task {
  final int id;
  String body;
  String deadline;
  Status status;
  Flags flag;

  Task(
      {this.id = -1,
      this.body = "No Task",
      this.deadline = "mm/dd/yyyy",
      this.status = Status.none,
      this.flag = Flags.none});

  Icon getIconStatus() {
    switch (status) {
      case Status.none:
        return const Icon(
          Icons.remove,
          color: Colors.red,
        );
      case Status.done:
        return const Icon(
          Icons.done,
          color: Colors.green,
        );
      case Status.process:
        return const Icon(
          Icons.bolt,
          color: Colors.orange,
        );
      case Status.archive:
        return const Icon(
          Icons.inventory_2,
          color: Colors.blueGrey,
        );
    }
  }
}

enum Status { done, process, archive, none }

enum Flags { personal, work, school, social, none }
