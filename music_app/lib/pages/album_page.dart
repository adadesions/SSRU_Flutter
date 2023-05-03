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
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg_musicapp.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("Albums"),
          elevation: 0,
          backgroundColor: const Color.fromARGB(50, 255, 89, 0),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(120))),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: albumList.length,
          itemBuilder: (BuildContext context, int index) {
            return Ink(
              color: const Color.fromARGB(10, 255, 89, 0),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                horizontalTitleGap: 20,
                minVerticalPadding: 5,
                leading: Image.asset(albumList[index].imgUrl),
                title: Text(
                    '${albumList[index].artist}, ${albumList[index].title}'),
                subtitle: Text(albumList[index].description),
                trailing: Text('${albumList[index].numSongs.toString()} Songs'),
                isThreeLine: true,
                dense: true,
                // visualDensity: VisualDensity(horizontal: -4, vertical: 4),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
