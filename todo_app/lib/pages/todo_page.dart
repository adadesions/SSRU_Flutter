import 'package:flutter/material.dart';

// Models
import '../models/task.dart';

// Data
import '../data/task_list.dart';

// Widgets
import '../elements/tasks.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<StatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Task> _taskList = taskList;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
        ),
        body: Tasks(
          taskList: taskList,
          onChangeCheckbox: _onChangeCheckbox,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNewTask,
          child: const Icon(Icons.add),
        ),
      );

  void _addNewTask() {
    setState(() {
      _taskList.add(Task(
          id: _taskList.length,
          body: "New task: 0${_taskList.length}",
          status: Status.process));
    });
  }

  void _onChangeCheckbox(int index) {
    setState(() {
      _taskList[index].status == Status.done
          ? _taskList[index].status = Status.process
          : _taskList[index].status = Status.done;
    });
  }
}
