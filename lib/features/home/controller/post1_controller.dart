import 'dart:convert';
import 'package:api_integration/core/endpoint.dart';
import 'package:api_integration/features/home/model/post1_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class Post1Controller extends GetxController {
  Future<List<Post1Model>> getPost1API() async {
    final List<Post1Model> post = [];

    try {
      final response = await http.get(Uri.parse(URLs.posts1));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        if (data is List) {
          for (var i in data) {
            post.add(Post1Model.fromJson(i as Map<String, dynamic>));
          }
        } else if (data is Map) {
          // single object -> wrap into list
          post.add(Post1Model.fromJson(data as Map<String, dynamic>));
        }
      }
    } catch (e) {
      print('Error in getPost1API: $e');
    }
    return post;
  }
}
