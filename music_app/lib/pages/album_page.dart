import 'package:flutter/material.dart';

// Models
// import '../models/album.dart';

// Data
import '../data/album_list.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          selectedItemColor: const Color.fromARGB(255, 255, 89, 0),
          backgroundColor: const Color.fromARGB(50, 255, 89, 0),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home001',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
