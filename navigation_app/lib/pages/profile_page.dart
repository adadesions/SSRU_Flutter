import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileStates();
}

class _ProfileStates extends State<ProfilePage> {
  final String _username = "Peter_Parker999";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Username: $_username", style: const TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () => context.go('/'),
                    child: const Text("Home")),
                TextButton(
                    onPressed: () =>
                        context.go('/editProfile/$_username?saveMethod=cloud'),
                    child: const Text("Edit")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// Come back at 10:50