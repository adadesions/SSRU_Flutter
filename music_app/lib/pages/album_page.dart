import 'package:flutter/material.dart';

// Models
import '../models/album.dart';

final List<Album> albumList = [
  Album("Jaff Satur", "Jaff Satur", 12, "assets/images/albums/jeff_cover.jpg"),
];

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<StatefulWidget> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums"),
      ),
      body: ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(albumList[index].imgUrl),
            title: Text(albumList[index].title),
            subtitle: Text(albumList[index].artist),
          );
        },
      ),
    );
  }
}
