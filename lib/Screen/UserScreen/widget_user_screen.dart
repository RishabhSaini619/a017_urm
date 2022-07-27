import 'package:a017_urm/Component/global_variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
        ),
        color: Color(0xffF5591F),
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

class UsersDataList extends StatefulWidget {
  @override
  State<UsersDataList> createState() => _UsersDataListState();
}

class _UsersDataListState extends State<UsersDataList> {

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("User");
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  List<DocumentSnapshot> User = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 25, top: 25, right: 25,),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: User.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> userData = User[index].data();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        //user heading
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xffF5591F),
                          child: Center(
                            child: Text(
                              "${userData[0].firstName} ${userData[0].lastName}",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //user name
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Name: ${userData[0].firstName} ${userData[0].lastName}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffF5591F),
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // user Date of Birth
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "DOB: ${userData[0].dateOfBirth}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffF5591F),
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    //user email
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Email: ${userData[0].email}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffF5591F),
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    //user password
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Password: ${userData[0].password}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffF5591F),
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Divider(
                        color: Color(0xffF5591F),
                        thickness: 2,
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  Future<void> getUser() async {
    QuerySnapshot querySnapshot = await userCollection.get();

    if (querySnapshot.docs.isNotEmpty) {
      User = querySnapshot.docs;
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> getUserDetail(String userId) async {
    DocumentSnapshot documentSnapshot = await userCollection.doc().get();
    print(documentSnapshot.exists);
    if (documentSnapshot.exists) {
      print(documentSnapshot.id);
      print(documentSnapshot.data);
    }
  }
}
