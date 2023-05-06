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
                    onSaved: (newValue) => {_task = newValue ?? ''},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'due'),
                    onSaved: (newValue) => {_dueDate = newValue ?? ''},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
