import 'package:flutter/material.dart';

// Models
import 'Models/album.dart';

void main() {
  runApp(const ApiApp());
}

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<StatefulWidget> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  late Future<List<Album>?> _futureAlbums;

  @override
  void initState() {
    super.initState();
    _futureAlbums = fetchAlbums();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Api app')),
        body: FutureBuilder<List<Album>?>(
          future: _futureAlbums,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, idx) => ListTile(
                        title: Text(snapshot.data![idx].title),
                        subtitle: Text(snapshot.data![idx].userId.toString()),
                        trailing: Text(snapshot.data![idx].id.toString()),
                      ));
            } else if (snapshot.hasError) {
              return Text('$snapshot.error');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
