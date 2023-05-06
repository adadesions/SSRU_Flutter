import 'package:flutter/material.dart';

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
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Task>>(
                future: _futureTasks,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder:(context, index) {
                      return snapshot.hasData ? ListTile(
                        title: snapshot.data![index].task,
                      ) : const CircularProgressIndicator();
                    },
                  )
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
