import 'package:api_integration/features/all_user/controller/all_user_controller.dart';
import 'package:flutter/material.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({super.key});

  AllUserController get _controller => AllUserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All User Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _controller.getAllUser(),
                builder: (context, snapshort) {
                  if (!snapshort.hasData) {
                    return const Center(child: Text("Loading..."));
                  } else {
                    final users = snapshort.data!;
                    if (users.isEmpty) {
                      return Center(child: Text('No users found.'));
                    } else {
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon( Icons.person, color: Colors.teal.shade300),
                              isThreeLine: true,
                              title: Text('Name: ${user.name}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: ${user.email}'),
                                  Text('Company: ${user.company.name}'),
                                ],
                              ),
                              trailing: Icon( Icons.arrow_forward_ios, size: 16, color: Colors.teal.shade300),
                              tileColor: Colors.blue.shade50,
                              onTap: () {
                                // Handle user tap if needed
                              },
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
