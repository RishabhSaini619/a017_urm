import 'package:a017_urm/Screen/LoginScreen/login_screen.dart';
import 'package:a017_urm/Screen/SignUpScreen/signup_screen.dart';
import 'package:a017_urm/Screen/UserScreen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _navScreen = [
    {'screen': LoginScreen(), 'title': 'Home'},
    {'screen': SignUpScreen(), 'title': 'Categories'},
    {'screen': UserScreen(), 'title': 'User'},
  ];
  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _navScreen[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xffF5591F),
        onTap: _selectedScreen,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? IconlyBold.login : IconlyLight.login,
              size: 20,
            ),
            label: "Login",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? IconlyBold.addUser : IconlyLight.addUser,
              size: 20,
            ),
            label: "SignUp",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2 ? IconlyBold.user3 : IconlyLight.user3,
              size: 20,
            ),
            label: "Users",
          ),
        ],
      ),
    );
  }
}