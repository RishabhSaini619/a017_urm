import 'package:a017_urm/Screen/LoginScreen/password_reset_screen/widget_password_reset_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            EmailField(),
            ResetButton(),
          ],
        ),
      ),
      // bottomNavigationBar: NavBarScreen(),
    );
  }
}
