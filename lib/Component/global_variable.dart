import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserModel {
  String firstName;
  String lastName;
  String email;
  String dateOfBirth;
  String password;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.password,
  });
}

List<UserModel> userData = [];

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController dateOfBirthController = TextEditingController();

//
final passFocusNode = FocusNode();
final formKey = GlobalKey<FormState>();
var obscureTextData = true;
bool isLoading = false;

//Submit validator
bool isEverythingCorrect = false;

//Error Message
String errorMessage = "";

bool isDateSelected = false;

//Date of Birt picker
DateTime selectedDate = DateTime.now();
Future<Null> handleSelectedDate(BuildContext context) async {
  DateTime pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime(2004),
    firstDate: DateTime(1900),
    lastDate: DateTime(2004),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Color(0xffF5591F),
            onPrimary: Color(0xffffffff),
            surface: Color(0xffffffff),
            onSurface: Color(0xffF5591F),
            primaryContainer: Color(0xffF5591F),
            onPrimaryContainer: Color(0xffffffff),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color(0xffffffff), // color of button's letters
              backgroundColor: Color(0xffF5591F), // Background color
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        child: child,
      );
    },
  );

  if (pickedDate != null) {
    isDateSelected = true;
    String formattedDate = DateFormat("dd/MM/yyyy").format(pickedDate);
    dateOfBirthController.text = formattedDate;
  }
}

//First Name Regex
String valFirstName(String value) {
  String pattern = r"[a-zA-Z]";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter Alphabets only';
  } else {
    return null;
  }
}

//Last Name Regex
String valLastName(String value) {
  String pattern = r"[a-zA-Z]";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter Alphabets only';
  } else {
    return null;
  }
}

//Date of Birth Regex
String valDOB(String value) {
  String pattern =
      r"(^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$)";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Invalid date format';
  } else {
    return null;
  }
}

//Email Regex
String valEmail(String value) {
  if (value.isEmpty || !(value.contains("@"))) {
    return 'Enter valid your email';
  } else {
    return null;
  }
}

//Password Regex
String valPassword(String value) {
  if (value.isEmpty || value.length < 8) {
    return 'Please enter a valid password';
  } else {
    return null;
  }
}
