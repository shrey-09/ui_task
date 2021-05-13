import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_task/afterLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginFormWithAutoValidation extends StatefulWidget {
  @override
  _LoginFormWithAutoValidationState createState() => _LoginFormWithAutoValidationState();

}



class _LoginFormWithAutoValidationState extends State<LoginFormWithAutoValidation> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _unameController = new TextEditingController();


  final _formKey = new GlobalKey<FormState>();
  late String? _uname;
  late String? _password;
  bool _autoValidate = false;

  _save() async{
    SharedPreferences localStorage= await SharedPreferences.getInstance();
    localStorage.setString('uname',_unameController.text.toString());
    localStorage.setBool("isLoginSuccessful",true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  child: Image.asset("logo.png")
                ),    
                SizedBox(height: 70.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Color(0xffF3F3F3),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            controller: _unameController,
                            onSaved: (value) => _uname = value,
                            validator: (String? _uname){
                              if (_uname!.length>10)
                                return "Username Length should be at max 10";
                              if(_uname!.length<3 && _uname!.length>0)
                                return "Username Length should be al least 3";
                              if (_uname!.length == 0) {
                                return "Username is Required";
                              }
                              else
                                return null;
                            },
                            style: style,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Username",
                                border: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20.0))),
                          ),

                          SizedBox(height: 25.0),

                          // TextFormField for email address

                          TextFormField(
                            autofocus: false,
                            controller: _passwordController,
                            validator: (String? value){
                              if (value!.length == 0) {
                                return "Password is Required";
                              }
                              if(value!.length<3 && value!.length>0)
                                return "Password Length should be al least 3";
                              if (value!.length>10)
                                return "Password Length should be at max 10";
                              else
                                return null;
                            },
                            onSaved: (value) => _password = value,
                            style: style,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                          ),

                               // divider

                          SizedBox(height: 20.0),

                          Material(                   // login button
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blueGrey[600],
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _save();
                                  sleep(Duration(seconds: 5));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => afterLogin()));
                                } else {
                                  setState(() {
                                    // validation error
                                    _autoValidate = true;
                                  });
                                }
                              },
                              child: Text("Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

