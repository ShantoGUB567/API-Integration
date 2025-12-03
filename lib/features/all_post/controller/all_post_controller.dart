import 'dart:convert';
import 'package:api_integration/core/endpoint.dart';
import 'package:api_integration/features/all_post/model/all_post_model.dart';
import 'package:http/http.dart' as http;

class AllPostController {
  Future<List<AllPostModel>> getPostAPI() async {
    final List<AllPostModel> postList = [];

    try {
      final response = await http.get(Uri.parse(URLs.posts));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());

        if (data is List) {
          for (var i in data) {
            postList.add(AllPostModel.fromJson(i as Map<String, dynamic>));
          }
        }
      }
    } catch (e) {
      print('Error in getPostAPI: $e');
    }

    return postList;
  }
}
