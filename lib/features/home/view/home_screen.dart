import 'package:api_integration/features/home/widgets/list_screen.dart';
import 'package:api_integration/features/home/widgets/post1_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        // ignore: deprecated_member_use
        backgroundColor: Color(Colors.teal.shade200.value),
      ),
      body: Column(
        children: [
          Spacer(),
          Center(child: Text('Welcome to the Home Screen!')),
          Spacer(),
          ListScreen(),
          Spacer(),
          // Get.toNamed(AppRoutes.post1);
          Post1Screen(), // Directly include Post1Screen here
          Spacer(),
        ],
      ),
    );
  }
}
