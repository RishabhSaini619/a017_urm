import 'dart:async';
import 'package:a017_urm/Screen/LoginScreen/login_screen.dart';
import 'package:a017_urm/Widget/nav_bar_screen/NavBarScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {


  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override

  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 4,
      ),
      intro,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/app_background.png",
                ),
                fit: BoxFit.fill
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/app_logo.png",
                  width: 300,
                  height: 300,
                ),
                Text(
                  "User Record\nManagement",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nolluqa',
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffF5591F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void intro() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(
        builder: (context) => NavBarScreen(),
      ),
    );
  }
}



