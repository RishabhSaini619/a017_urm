import 'package:a017_urm/Component/global_variable.dart';
import 'package:a017_urm/Screen/LoginScreen/login_screen.dart';
import 'package:a017_urm/Screen/UserScreen/user_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
              "Register",
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

class FirstNameField extends StatelessWidget {
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
      height: 50,
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
        controller: firstNameController,
        keyboardType: TextInputType.name,
        validator: (value) => valFirstName(value),
        style: TextStyle(
          color: Color(0xffF5591F),
        ),
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Color(0xffF5591F),
          ),
          hintText: "First Name",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class LastNameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 50,
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
        controller: lastNameController,
        keyboardType: TextInputType.name,
        validator: (value) => valLastName(value),
        style: TextStyle(
          color: Color(0xffF5591F),
        ),
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Color(0xffF5591F),
          ),
          hintText: "Last Name",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class DoBField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
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
        textInputAction: TextInputAction.next,
        controller: dateOfBirthController,
        keyboardType: TextInputType.datetime,
        validator: (value) => valDOB(value),
        onTap: () async {
          return handleSelectedDate(context);
        },
        style: TextStyle(
          color: Color(0xffF5591F),
        ),
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          focusColor: Color(0xffF5591F),
          icon: Icon(
            Icons.date_range,
            color: Color(0xffF5591F),
          ),
          hintText: "DD/MM/YY",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class EmailField extends StatefulWidget {
  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  @override
  void initState() {
    // firebase
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 50,
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
        style: TextStyle(
          color: Color(0xffF5591F),
        ),
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Color(0xffF5591F),
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              print("Searching email");
              bool existOrNot = await checkUserId('${emailController.text}');
              if (existOrNot) {
              } else
                getUserDetail('${emailController.text}');
            },
            icon: Icon(
              IconlyLight.search,
              size: 20,
              color: Color(0xffF5591F),
            ),
          ),
          hintText: "Email & check for availability",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 50,
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
        textInputAction: TextInputAction.done,
        onEditingComplete: () {
          RegisterButton();
        },
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) => valPassword(value),
        obscureText: obscureTextData,
        style: const TextStyle(
          color: Color(0xffF5591F),
        ),
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          focusColor: Color(0xffF5591F),
          icon: Icon(
            Icons.vpn_key,
            color: Color(0xffF5591F),
          ),

          suffixIcon: IconButton(
            icon: Icon(
              obscureTextData ? Icons.visibility:
              Icons.visibility_off,
              color: Color(0xffF5591F),
            ),
            onPressed:
             () {
              setState(
                    () {
                  obscureTextData = !obscureTextData;
                },
              );
            },
          ),
          hintText: "Enter Password",
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class RegisterButton extends StatefulWidget {
  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // firebase
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
      ),
      child: InkWell(
        onTap: () {
          firebaseAuth.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          if (firstNameController.text == null) {
            errorMessage = "*Enter First Name";
            setState(() {});
          } else if (lastNameController.text == null) {
            errorMessage = "*Enter Last Name";
            setState(() {});
          } else if (emailController.text == null) {
            errorMessage = "*Enter email";
            setState(() {});
          } else if (dateOfBirthController.text == null) {
            errorMessage = "*Enter Date of Birth";
            setState(() {});
          } else if (passwordController == null) {
            errorMessage = "*Enter Password";
            setState(() {});
          } else {
            isEverythingCorrect = true;
            setState(() {});
          }
          //Adding user date to the List
          if (isEverythingCorrect) {
            userData.add(
              UserModel(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                email: emailController.text,
                dateOfBirth: dateOfBirthController.text,
                password: passwordController.text,
              ),
            );
            print(
                "User '${firstNameController.text.toUpperCase()} ${lastNameController.text.toUpperCase()}' is added");
            //cleat text field
            firstNameController.clear();
            lastNameController.clear();
            emailController.clear();
            dateOfBirthController.clear();
            passwordController.clear();
            // switch to user screen
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
          height: 50,
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
            "REGISTER",
            style: TextStyle(
              color: Color(0xffEEEEEE),
            ),
          ),
        ),
      ),
    );
  }
}

class LogInSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Have Already Member?  "),
          GestureDetector(
            child: Text(
              "Login Now",
              style: TextStyle(
                color: Color(0xffF5591F),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

Future<void> getUserDetail(String userId) async {
  DocumentSnapshot documentSnapshot = await userCollection.doc().get();

  if (documentSnapshot.exists) {
    print(documentSnapshot.id);
    print(documentSnapshot.data);
  }
}

Future<bool> checkUserId(String id) async {
  DocumentSnapshot documentSnapshot = await userCollection.doc(id).get();
  return documentSnapshot.exists;
}

void getUser() async {
  QuerySnapshot querySnapshot = await userCollection.get();
  if (querySnapshot.docs.isNotEmpty) {
    print(querySnapshot.docs.length);
  } else
    print("not found");
}
