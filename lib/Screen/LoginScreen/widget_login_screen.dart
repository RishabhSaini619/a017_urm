import 'package:a017_urm/Component/global_variable.dart';
import 'package:a017_urm/Screen/SignUpScreen/signup_screen.dart';
import 'package:a017_urm/Screen/UserScreen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference userCollection =
    FirebaseFirestore.instance.collection('User');
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
        ),
        color: new Color(0xffF5591F),
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
            margin: EdgeInsets.fromLTRB(135,20, 0, 0),
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
              "LogIn",
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

class EmailField extends StatelessWidget {
  const EmailField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: Color(0xffEEEEEE),
          ),
        ],
      ),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => valEmail(value),
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Color(0xffF5591F),
          ),
          hintText: "Email",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xffEEEEEE),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 100,
            color: Color(0xffEEEEEE),
          ),
        ],
      ),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) => valPassword(value),
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          focusColor: Color(0xffF5591F),
          icon: Icon(
            Icons.vpn_key,
            color: Color(0xffF5591F),
          ),
          hintText: "Enter Password",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forget Password?",
        ),
      ),
    );
  }
}

class LogInButton extends StatefulWidget {
  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    emailController.text = null;
    passwordController.text = null;

    // firebase
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        firebaseAuth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        if (emailController.text == null) {
          errorMessage = "*Enter email";
          setState(() {});
        } else if (passwordController == null) {
          errorMessage = "*Enter Password";
          setState(() {});
        } else {
          isEverythingCorrect = true;
          setState(() {});
        }
        if (isEverythingCorrect) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserScreen(),
            ),
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 100,
        ),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 54,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              (new Color(0xffF5591F)),
              new Color(0xffF2861E),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xffEEEEEE),
            ),
          ],
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SignUpSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't Have Any Account?  "),
          GestureDetector(
            child: Text(
              "Register Now",
              style: TextStyle(
                color: Color(0xffF5591F),
              ),
            ),
            onTap: () {
              // Write Tap Code Here.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<void> getUserDetail(String userId) async {
  DocumentSnapshot documentSnapshot = await userCollection.doc().get();
  print(documentSnapshot.exists);
  if (documentSnapshot.exists) {
    print(documentSnapshot.id);
    print(documentSnapshot.data);
  }
}

void getUser() async {
  QuerySnapshot querySnapshot = await userCollection.get();
  if (querySnapshot.docs.isNotEmpty) {
    print(querySnapshot.docs.length);
  } else
    errorMessage = "not found";
  errorMessage = "";
}
