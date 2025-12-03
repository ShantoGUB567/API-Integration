import 'package:api_integration/features/all_todo/controller/all_todo_controller.dart';
import 'package:flutter/material.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  AllTodoController get _controller => AllTodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Todo Screen'),
        backgroundColor: Colors.teal.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _controller.getAllTodo(),
                builder: (context, snapshort) {
                  if (!snapshort.hasData) {
                    return Center(child: Text("Loading..."));
                  } else {
                    final todos = snapshort.data!;
                    if (todos.isEmpty) {
                      return Center(child: Text("No todos available"));
                    } else {
                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.check_circle,
                                  color: todo.completed
                                      ? Colors.green
                                      : Colors.red),
                              title: Text('Todo: ${todo.title}'),
                              subtitle:
                                  Text('Completed: ${todo.completed}'),
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
