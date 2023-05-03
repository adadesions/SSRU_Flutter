import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.username});
  final String username;

  @override
  State<StatefulWidget> createState() => _ProfileStates();
}

class _ProfileStates extends State<ProfilePage> {
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
            Text("Username: ${widget.username}",
                style: const TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () => context.go('/'),
                    child: const Text("Home")),
                TextButton(
                    onPressed: () => context
                        .go('/editProfile/${widget.username}?saveMethod=cloud'),
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