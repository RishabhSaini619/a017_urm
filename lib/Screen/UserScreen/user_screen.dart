import 'package:a017_urm/Screen/UserScreen/widget_user_screen.dart';
import 'package:a017_urm/Widget/nav_bar_screen/NavBarScreen.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            //userList
            UsersDataList(),
          ],
        ),
      ),
      // bottomNavigationBar: NavBarScreen(),
    );
  }
}
