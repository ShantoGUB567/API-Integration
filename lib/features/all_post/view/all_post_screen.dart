// lib/features/post/view/post_screen.dart
import 'package:flutter/material.dart';
import 'package:api_integration/features/all_post/controller/all_post_controller.dart';
import 'package:api_integration/features/all_post/model/all_post_model.dart';

class AllPostScreen extends StatelessWidget {
  const AllPostScreen({super.key});

  AllPostController get _controller => AllPostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<AllPostModel>>(
                future: _controller.getPostAPI(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Loading'));
                  } else {
                    final posts = snapshot.data!;
                    if (posts.isEmpty) {
                      return const Center(child: Text('No posts found.'));
                    }
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text('Title- ${post.title}'),
                            subtitle: Text(post.body),
                            tileColor: Colors.blue.shade50,
                          ),
                        );
                      },
                    );
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
