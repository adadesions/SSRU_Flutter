import 'package:flutter/material.dart';

// Data
import '../data/task_list.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
        ),
        body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) => Ink(
            // color: Colors.lightBlue,
            child: ListTile(
              title: Text(taskList[index].body),
              subtitle: Text(taskList[index].status.toString()),
              onTap: () {},
            ),
          ),
        ),
      );
}
