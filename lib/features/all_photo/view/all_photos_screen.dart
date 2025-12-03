import 'package:api_integration/features/all_photo/controller/all_photo_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AllPhotosScreen extends StatelessWidget {
  const AllPhotosScreen({super.key});

  AllPhotoController get _controller => AllPhotoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Photos Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _controller.getAllPhotos(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text("Loading..."));
                  } else {
                    final photos = snapshot.data!;
                    if (photos.isEmpty) {
                      return Center(child: Text("No photos available"));
                    } else {
                      return ListView.builder(
                        itemCount: photos.length,
                        itemBuilder: (context, index) {
                          final photo = photos[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Image.network(photo.thumbnailUrl),
                              title: Text('Photo Title: ${photo.title}'),
                              subtitle: Text('Photo ID: ${photo.id}'),
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
