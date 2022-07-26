import 'package:a017_urm/Component/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
        ),
        color:  Color(0xffF5591F),
        gradient: LinearGradient(
          colors: [
            (new Color(0xffF5591F)),
            new Color(0xffF2861E),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(135, 20, 0, 0),
            child: Image.asset(
              "assets/images/app_logo.png",
              height: 125,
              width: 125,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            alignment: Alignment.bottomRight,
            child: Text(
              "User",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UsersDataList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 25, top: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Name
                Text(
                  "Name: ${userData[0].firstName} ${userData[0].lastName}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffF5591F),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  thickness: 5,
                  height: 30,
                  color: Color(0xffF5591F),
                ),
                //Email
                Text(
                  "Email: ${userData[0].email}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffF5591F),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  thickness: 5,
                  height: 30,
                  color: Color(0xffF5591F),
                ),
                //Date of Birth
                Text(
                  "DOB: ${userData[0].dateOfBirth}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffF5591F),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
    );
  }
}



