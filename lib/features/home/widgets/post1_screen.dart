import 'package:flutter/material.dart';
import 'package:api_integration/features/home/controller/post1_controller.dart';
import 'package:api_integration/features/home/model/post1_model.dart';

class Post1Screen extends StatelessWidget {
  Post1Screen({Key? key}) : super(key: key);

  final Post1Controller _controller = Post1Controller();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.teal.shade200,
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'This is Post 1 Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: FutureBuilder<List<Post1Model>>(
              future: _controller.getPost1API(),
              builder: (context, snapshot) {
                // show loading while waiting
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text('Loading...'));
                }

                // handle error
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                // data (may be null)
                final posts = snapshot.data ?? [];

                if (posts.isEmpty) {
                  return const Center(child: Text('No posts found.'));
                }

                // API returns single object wrapped as a list -> use first element
                final Post1Model first = posts[0];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title: ${first.title}", 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text("Body: ${first.body}"),
                  ],
                );
              },
            ),
          ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
