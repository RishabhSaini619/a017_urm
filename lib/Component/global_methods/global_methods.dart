import 'package:a017_urm/Component/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class GlobalMethod {
  static navigateTo({
     BuildContext context,
     String routeName,
  }) {
    Navigator.pushNamed(
      context,
      routeName,
    );
  }

  static Future<void> warningDialog({
     String title,
     String subtitle,
     Function function,
     BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/others/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                ),
                ),
            ),
            TextButton(
              onPressed: () {
                function();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text("ok",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> errorDialog({
     String subtitle,
     BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/others/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('An Error occurred'),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                "ok",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> addToCart(
      { String productId,
       int quantity,
       BuildContext context}) async {
    final User user = authInstance.currentUser;
    final _uid = user.uid;
    final cartId = const Uuid().v4();
    try {
      FirebaseFirestore.instance.collection('users').doc(_uid).update({
        'userCart': FieldValue.arrayUnion([
          {
            'cartId': cartId,
            'productId': productId,
            'quantity': quantity,
          }
        ])
      });
      await Fluttertoast.showToast(
        msg: "Item has been added to your cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } catch (error) {
      errorDialog(subtitle: error.toString(), context: context);
    }
  }

  static Future<void> addToWishlist(
      { String productId,  BuildContext context}) async {
    final User user = authInstance.currentUser;
    final _uid = user.uid;
    final wishlistId = const Uuid().v4();
    try {
      FirebaseFirestore.instance.collection('users').doc(_uid).update(
        {
          'userWish': FieldValue.arrayUnion(
            [
              {
                'wishlistId': wishlistId,
                'productId': productId,
              }
            ],
          ),
        },
      );
      await Fluttertoast.showToast(
        msg: "Item has been added to your wishlist",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } catch (error) {
      errorDialog(
        subtitle: error.toString(),
        context: context,
      );
    }
  }
}
