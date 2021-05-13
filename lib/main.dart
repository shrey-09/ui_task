import 'package:flutter/material.dart';
import 'package:ui_task/afterLogin.dart';
import 'loginform.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   sharedPreferenccesMethod();
//   runApp(MyApp());
// }
// Future<bool> sharedPreferenccesMethod() async{
//   late SharedPreferences localStorage;
//   localStorage = await SharedPreferences.getInstance();
//   if (localStorage.getBool("isLoginSuccessful")==null)
//     return false;
//   else
//     return true;
//
// }
// // ignore: must_be_immutable
// class MyApp extends StatelessWidget {
//   late Future<bool> isLoginDoneBefore;
//   initState(){
//     isLoginDoneBefore = sharedPreferenccesMethod();
//   }
//   @override
//   Widget build(BuildContext context) {
//     // ignore: unnecessary_null_comparison
//     if( isLoginDoneBefore==null){
//       return MaterialApp(
//         title: 'Login Form',
//         theme: ThemeData(
//           primarySwatch: Colors.blueGrey,
//         ),
//         home: LoginFormWithAutoValidation(),
//       );
//     }
//     else {
//       return MaterialApp(
//         title: 'Login Form',
//         theme: ThemeData(
//           primarySwatch: Colors.blueGrey,
//         ),
//         home: isLoginDoneBefore==true? afterLogin() : LoginFormWithAutoValidation(),
//       );
//     }
//   }
// }





void main() {
  runApp(MyApp());
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // late bool? isLoginDoneBefore = localStorage.getBool("isLoginSuccessful");
  bool? isLoginDoneBefore;
  _getData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    isLoginDoneBefore=localStorage.getBool("isLoginSuccessful");
  }
  void initState(){
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    if(isLoginDoneBefore==null)
      isLoginDoneBefore=false;

    if(isLoginDoneBefore! ==false){
      print("Nope");
      return MaterialApp(
        title: 'Login Form',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: LoginFormWithAutoValidation(),
      );
    }
    else {
      print("Yep");
      return MaterialApp(
        title: 'Login Form',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: afterLogin(),
      );
    }
  }
}