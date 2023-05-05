import 'package:flutter/material.dart';
import 'package:apis_app/models/post.dart';

class Newsfeed extends StatefulWidget {
  const Newsfeed({super.key});

  @override
  State<StatefulWidget> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  late Future<List<Post>?> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Newsfeed')),
      body: FutureBuilder<List<Post>?>(
          future: _futurePosts,
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Checkbox(
                          value: snapshot.data![index].completed, 
                          onChanged: (bool? value) {  },
                        ),
                        title: Text(snapshot.data![index].title),
                        subtitle:
                            Text(snapshot.data![index].completed.toString()),
                      ))
              : const CircularProgressIndicator()),
    );
  }
}
