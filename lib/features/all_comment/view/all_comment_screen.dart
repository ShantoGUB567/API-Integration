import 'package:api_integration/features/all_comment/controller/all_comment_controller.dart';
import 'package:flutter/material.dart';

class AllCommentScreen extends StatelessWidget {
  const AllCommentScreen({super.key});

  AllCommentController get _controller => AllCommentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Comment Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _controller.getAllComments(),
                builder: (context, snapshort) {
                  if (!snapshort.hasData) {
                    return Center(child: Text("Loading..."));
                  } else {
                    final comments = snapshort.data!;
                    if (comments.isEmpty) {
                      return Center(child: Text("No comments available"));
                    } else {
                      return ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon( Icons.comment, color: Colors.teal.shade300),
                              isThreeLine: true,
                              title: Text('Name: ${comment.name}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: ${comment.email}'),
                                  SizedBox(height: 5),
                                  Text('Comment: ${comment.body}'),
                                ],
                              ),
                              trailing: Icon( Icons.arrow_forward_ios, size: 16, color: Colors.teal.shade300),
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
