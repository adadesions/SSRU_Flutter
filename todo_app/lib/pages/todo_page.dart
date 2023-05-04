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
  Map<Flags, int> _totalTasks = {};

  void calTotalTasks() {
    Map<Flags, int> result = {};
    for (Task t in _taskList) {
      if (result[t.flag] == null) {
        result[t.flag] = 1;
      } else {
        result[t.flag] = result[t.flag]! + 1;
      }
    }

    setState(() {
      _totalTasks = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    calTotalTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true, // all devices, use MediaQuery
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                height: 100,
                width: 250,
                padding: const EdgeInsets.all(10),
                color: Colors.red,
                margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${_totalTasks[Flags.personal]} tasks",
                      style: TextStyle(fontSize: 16, letterSpacing: 5),
                    ),
                    Text(
                      "Personal",
                      style: TextStyle(fontSize: 26, letterSpacing: 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Tasks(
            taskList: taskList,
            onChangeCheckbox: _onChangeCheckbox,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }

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
