import 'package:api_integration/features/all_album/view/all_album_screen.dart';
import 'package:api_integration/features/all_comment/view/all_comment_screen.dart';
import 'package:api_integration/features/all_photo/view/all_photos_screen.dart';
import 'package:api_integration/features/all_todo/view/all_todo_screen.dart';
import 'package:api_integration/features/all_user/view/all_user_screen.dart';
import 'package:api_integration/features/home/view/home_screen.dart';
import 'package:api_integration/features/home/widgets/post1_screen.dart';
import 'package:api_integration/features/all_post/view/all_post_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/home';
  static const String post1 = '/post1';
  static const String post = '/post'; 
  static const String allPhotos = '/allPhotos';
  static const String allComments = '/allComments';
  static const String allAlbums = '/allAlbums';
  static const String allTodos = '/allTodos';
  static const String allUsers = '/allUsers'; 

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: post1, page: () => Post1Screen()),
    GetPage(name: post, page: () => AllPostScreen()),

    GetPage(name: allUsers, page: () => AllUserScreen()),
    GetPage(name: allPhotos, page: () => AllPhotosScreen()),
    GetPage(name: allComments, page: () => AllCommentScreen()),
    GetPage(name: allAlbums, page: () => AllAlbumScreen()),
    GetPage(name: allTodos, page: () => AllTodoScreen()),
  ];
}
