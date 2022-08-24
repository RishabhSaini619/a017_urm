import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screen/SplashScreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCw74vQ8Kj6jDl4Gh1kHJO3PW-Wb6aiSZs",
        appId: "1:541130030469:web:8b57646c2e8285d29fd8ec",
        messagingSenderId: "541130030469",
        projectId: "a017-urm",
      ),
    );
  } catch (e) {
    print(e);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Record Management',
      home: SplashScreen(),
    );
  }
}
