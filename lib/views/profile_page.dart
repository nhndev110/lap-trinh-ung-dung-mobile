import 'package:flutter/material.dart';
import 'package:test1/models/user_data.dart';
import 'package:test1/services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserData? userData = AuthService.userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/login");
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: ListView(
        children: [
          Text("name: ${userData!.firstName} ${userData!.lastName}"),
          Text("username: ${userData!.username}"),
          Text("username: ${userData!.email}"),
        ],
      ),
    );
  }
}
