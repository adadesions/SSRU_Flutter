import 'package:flutter/material.dart';

// Models
import '../models/task.dart';

class Tasks extends StatelessWidget {
  final List<Task> taskList;

  const Tasks({super.key, this.taskList = const <Task>[]});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) => Ink(
        // color: Colors.lightBlue,
        child: ListTile(
          title: Text(taskList[index].body),
          subtitle: Text(taskList[index].status.toString()),
          onTap: () {},
        ),
      ),
    );
  }
}
