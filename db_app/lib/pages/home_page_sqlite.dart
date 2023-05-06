import 'package:flutter/material.dart';

// Models
import '../models/task.dart';

// Services
import '../services/sqlite_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKeys = GlobalKey<FormState>();

  String _task = '';

  String _dueDate = '';

  List<Task> _taskDB = [];

  int _latestId = 0;

  @override
  void initState() {
    super.initState();
    SqliteService.initializeDB().whenComplete(() async {
      _updatedTaskList();
    });
  }

  void _updatedTaskList() async {
    final data = await SqliteService.getTasks();
    setState(() {
      _taskDB = data;
      _latestId = _task.length + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKeys,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Thing to do...'),
                    onSaved: (newValue) {
                      _task = newValue ?? '';
                      print('task saved: $_task');
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'due'),
                    onSaved: (newValue) {
                      _dueDate = newValue ?? '';
                      print('due saved: $_dueDate');
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      _formKeys.currentState!.save();
                      setState(() {
                        // Add task to database
                        SqliteService.createTask(Task(
                            id: _latestId, task: _task, dueDate: _dueDate));

                        // Force update UIs
                        _updatedTaskList();
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _taskDB.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_taskDB[index].task),
                    subtitle: Text(_taskDB[index].dueDate),
                    trailing: TextButton(
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        SqliteService.deleteTask(_taskDB[index].id);
                        _updatedTaskList();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
