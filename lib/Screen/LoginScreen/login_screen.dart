import 'package:a017_urm/Screen/LoginScreen/widget_login_screen.dart';
import 'package:a017_urm/Widget/bottom_Navigator_Bar/NavBarScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            EmailField(),
            PasswordField(),
            ForgetPassword(),
            LogInButton(),
            SignUpSwitch()
          ],
        ),
      ),
      // bottomNavigationBar: NavBarScreen(),
    );
  }
}
