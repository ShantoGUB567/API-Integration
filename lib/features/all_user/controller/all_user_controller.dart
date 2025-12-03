import 'dart:convert';

import 'package:api_integration/core/endpoint.dart';
import 'package:api_integration/features/all_user/model/all_user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllUserController extends GetxController {
  Future<List<AllUserModel>> getAllUser() async {
    final List<AllUserModel> userList = []; 

    try {
      final response = await http.get(Uri.parse(URLs.users));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        if (data is List) {
          for (var i in data) {
            userList.add(AllUserModel.fromJson(i as Map<String, dynamic>));
          }
        }
      }
    } catch (e) {
      print('Error in getAllUser: $e');
    }
    return userList;
  }
}
