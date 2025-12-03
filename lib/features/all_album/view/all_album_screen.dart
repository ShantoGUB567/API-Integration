import 'package:flutter/material.dart';

class AllAlbumScreen extends StatelessWidget {
  const AllAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Album Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: const Center(
        child: Text('All Album Screen Content Here'),
      ),
    );
  }
}