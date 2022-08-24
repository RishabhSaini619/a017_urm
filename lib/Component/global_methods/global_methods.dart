import 'package:flutter/material.dart';


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
                'assets/images/error.png',
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

}
