import 'dart:convert';
import 'package:api_integration/core/endpoint.dart';
import 'package:api_integration/features/all_todo/model/all_todo_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllTodoController extends GetxController {
  Future<List<AllTodoModel>> getAllTodo() async {
    final List<AllTodoModel> todoList = [];

    try {
      final response = await http.get(Uri.parse(URLs.todos));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        if (data is List) {
          for (var i in data) {
            todoList.add(AllTodoModel.fromJson(i as Map<String, dynamic>));
          }
        }
      }
    } catch (e) {
      print('Error in getAllTodo: $e');
    }

    return todoList;
  }
}
