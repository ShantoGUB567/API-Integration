import 'package:flutter/material.dart';

class AllPhotosScreen extends StatelessWidget {
  const AllPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Photos Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: const Center(
        child: Text('All Photos Screen Content Here'),
      ),
    );
  }
}