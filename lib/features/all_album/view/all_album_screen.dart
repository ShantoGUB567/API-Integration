import 'package:api_integration/features/all_album/controller/all_album_controller.dart';
import 'package:flutter/material.dart';

class AllAlbumScreen extends StatelessWidget {
  const AllAlbumScreen({super.key});

  AllAlbumController get _controller => AllAlbumController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Album Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _controller.getAllAlbum(),
                builder: (contex, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading...'));
                  } else {
                    final albums = snapshot.data!;
                    if (albums.isEmpty) {
                      return Center(child: Text('No albums found'));
                    } else {
                      return ListView.builder(
                        itemCount: albums.length,
                        itemBuilder: (context, index) {
                          final album = albums[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text('Album Title: ${album.title}'),
                              tileColor: Colors.blue.shade50,
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
