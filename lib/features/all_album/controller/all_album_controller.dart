import 'dart:convert';

import 'package:api_integration/core/endpoint.dart';
import 'package:api_integration/features/all_album/model/all_album_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllAlbumController extends GetxController {
  Future<List<AllAlbumModel>> getAllAlbum() async {
    final List<AllAlbumModel> albumList = [];

    try {
      final response = await http.get(Uri.parse(URLs.albums));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        if (data is List) {
          for (var i in data) {
            albumList.add(AllAlbumModel.fromJson(i as Map<String, dynamic>));
          }
        }
      }
    } catch (e) {
      print('Error in getAllAlbum: $e');
    }
    return albumList;
  }
}
