import 'package:flutter/material.dart';

import '../models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKeys = GlobalKey<FormState>();

  String _task = '';

  String _dueDate = '';

  late Future<List<Task>> _futureTasks;

  @override
  void initState() {
    super.initState();
    _futureTasks = Task.readFile('assets/storages/tasks.json');
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
                      // Update _futureTask state
                      setState(() {
                        _futureTasks.then((taskList) {
                          taskList
                              .add(Task(id: 0, task: _task, dueDate: _dueDate));
                          // Write new task to the file
                          Task.writeFile(
                              taskList, 'assets/storages/tasks.json', true);
                        });
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Task>>(
                future: _futureTasks,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].task),
                              subtitle: Text(snapshot.data![index].dueDate),
                            );
                          },
                        )
                      : const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
