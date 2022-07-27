import 'package:a017_urm/Component/firebase_constants.dart';
import 'package:a017_urm/Component/global_methods/global_methods.dart';
import 'package:a017_urm/Component/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              "Password Reset",
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
        textInputAction: TextInputAction.next,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => valEmail(value),
        style: const TextStyle(
          color: Color(0xffF5591F),
        ),
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


class ResetButton extends StatefulWidget {
  @override
  State<ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  void initState() {
    emailController.text = null;
    // firebase
    getUser();

    super.initState();
  }

  // void dispose() {
  //    emailController.dispose();
  //   passwordController.dispose();
  //   passFocusNode.dispose();
  //   super.dispose();
  // }

  bool isLoading = false;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (emailController.text.isEmpty ||
            emailController.text.contains("@")) {
          GlobalMethod.errorDialog(
              subtitle: 'Please enter a correct email address', context: context);
        } else {
          setState(() {
            isLoading = true;
          });
          try {
            await authInstance.sendPasswordResetEmail(
                email: emailController.text.toLowerCase());
            Fluttertoast.showToast(
              msg: "An email has been sent to your email address",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey.shade600,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } on FirebaseException catch (error) {
            GlobalMethod.errorDialog(
                subtitle: '${error.message}', context: context);
            setState(() {
              isLoading = false;
            });
          } catch (error) {
            GlobalMethod.errorDialog(subtitle: '$error', context: context);
            setState(
                  () {
                isLoading = false;
              },
            );
          } finally {
            setState(
                  () {
                isLoading = false;
              },
            );
          }
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
          "Reset Now",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
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
