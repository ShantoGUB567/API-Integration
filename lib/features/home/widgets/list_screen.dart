import 'package:api_integration/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          customTile(
            leading: Icon(Icons.person),
            title: "All Users",
            onTap: () {
              Get.toNamed(AppRoutes.allUsers);
            }, 
          ),
          customTile(
            leading: Icon(Icons.post_add),
            title: "All Posts",
            onTap: () {
              Get.toNamed(AppRoutes.post);
            }, 
          ),
          customTile(
            leading: Icon(Icons.comment),
            title: "All Comments",
            onTap: () {
              Get.toNamed(AppRoutes.allComments);
            }, 
          ), 
          customTile(
            leading: Icon(Icons.album),
            title: "All Albums",
            onTap: () {
              Get.toNamed(AppRoutes.allAlbums);
            }, 
          ),
          customTile( 
            leading: Icon(Icons.photo),
            title: "All Photos",
            onTap: () {
              Get.toNamed(AppRoutes.allPhotos);
            }, 
          ),
          customTile(
            leading: Icon(Icons.alarm),
            title: "All Todos",
            onTap: () {
              Get.toNamed(AppRoutes.allTodos);
            }, 
          ),
          
        ],
      )
    );
  }
}

Widget customTile({
  required String title,
  required VoidCallback onTap,
  required Widget leading,
}) {

    return Container(
      margin: EdgeInsets.all(5),
      child: ListTile(
        leading: leading,
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
        tileColor: Colors.teal.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
}
