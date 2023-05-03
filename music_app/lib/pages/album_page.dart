import 'package:flutter/material.dart';

// Models
import '../models/album.dart';

final List<Album> albumList = [
  Album(
      title: "Jaff Satur",
      artist: "Jaff Satur",
      description: "Artist under Wayfer Records, Warner Music Thailand.",
      numSongs: 12,
      imgUrl: "assets/images/albums/jeff_cover.jpg"),
  Album(
      title: "Gaze",
      artist: "Ice Saranyu",
      description:
          "An album designed for late-night listening, with a mix of mellow and upbeat tracks.",
      numSongs: 9,
      imgUrl: "assets/images/albums/ice_saranyu_cover.jpg"),
  Album(
      title: "Metamorphosis",
      artist: "Palmy",
      description:
          "An album that explores the different stages of love and relationships, with a mix of electronic and acoustic sounds.",
      numSongs: 11,
      imgUrl: "assets/images/albums/palmy_cover.jpg"),
  Album(
      title: "Monologue",
      artist: "Stamp Apiwat",
      description:
          "A solo album by Stamp Apiwat, with introspective lyrics and a mix of pop and rock sounds.",
      numSongs: 10,
      imgUrl: "assets/images/albums/stamp_apiwat_cover.jpg"),
  Album(
      title: "The Revolution",
      artist: "Slot Machine",
      description:
          "An album that blends classic rock and modern pop sounds, with politically charged lyrics.",
      numSongs: 9,
      imgUrl: "assets/images/albums/slot_machine_cover.jpg"),
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
        title: const Text("Albums"),
      ),
      body: ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(albumList[index].imgUrl),
            title: Text(albumList[index].title),
            subtitle: Text(albumList[index].description),
            trailing: Text('${albumList[index].numSongs.toString()} Songs'),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
