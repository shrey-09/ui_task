import 'package:flutter/material.dart';
import 'package:ui_task/afterLogin.dart';
import 'loginform.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences localStorage;
void main() {
  sharedPreferenccesMethod();
  runApp(MyApp());
}
Future sharedPreferenccesMethod() async{
  localStorage = await SharedPreferences.getInstance();
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late bool? isLoginDoneBefore = localStorage.getBool("isLoginSuccessful");

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if(localStorage==null || isLoginDoneBefore==null){
      return MaterialApp(
        title: 'Login Form',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: LoginFormWithAutoValidation(),
      );
    }
    else {
      return MaterialApp(
        title: 'Login Form',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: isLoginDoneBefore! ? afterLogin() : LoginFormWithAutoValidation(),
      );
    }
  }
}