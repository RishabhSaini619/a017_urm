import 'package:a017_urm/Screen/SignUpScreen/widget_signup_screen.dart';
import 'package:a017_urm/Widget/bottom_Navigator_Bar/bottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            TopBar(),
            //Full Name
            FirstNameField(),
            LastNameField(),
            //DateOfBirth
            DoBField(),
             //Email
            EmailField(),
            // password
            PasswordField(),
             //register
            RegisterButton(),
             //login
            LogInSwitch(),
          ],
        ),
      ),
      // bottomNavigationBar: NavBarScreen(),
    );
  }
}
