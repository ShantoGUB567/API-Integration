import 'dart:convert';
import 'package:api_integration/core/endpoint.dart';
import 'package:api_integration/features/all_comment/model/all_comment_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllCommentController extends GetxController {
  Future<List<AllCommentModel>> getAllComments() async {
    final List<AllCommentModel> commentList = [];

    try {
      final response = await http.get(Uri.parse(URLs.comments));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        if (data is List) {
          for (var i in data) {
            commentList.add(AllCommentModel.fromJson(i as Map<String, dynamic>));
          }
        }
      }
    } catch (e) {
      print('Error in getAllComments: $e');
    }

    return commentList;
  }
}
