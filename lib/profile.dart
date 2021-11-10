import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィールページ"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
      ),
    );
  }
}

