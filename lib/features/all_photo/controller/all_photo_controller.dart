import 'dart:convert';

import 'package:api_integration/core/endpoint.dart';
import 'package:api_integration/features/all_photo/model/all_photo_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllPhotoController extends GetxController {
  Future<List<dynamic>> getAllPhotos() async {
    final List<dynamic> photoList = [];

    try {
      final response = await http.get(Uri.parse(URLs.photos));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        if (data is List) {
          for (var i in data) {
            photoList.add(AllPhotoModel.fromJson(i as Map<String, dynamic>));
          }
        }
      }
    } catch (e) {
      print('Error in getAllPhotos: $e');
    }
    return photoList;
  }
}
