import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    required this.username,
    required this.saveMethod,
  });
  final String username;
  final String saveMethod;

  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  final TextStyle bodyStyle = const TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Edit Username: ${widget.username}',
                style: bodyStyle,
              ),
              Text(
                'Save Method: ${widget.saveMethod}',
                style: bodyStyle,
              ),
              TextButton(
                  onPressed: () => context.go('/profile'),
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
