import 'package:deneme/utils/styles.dart';
import 'package:deneme/utils/styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:deneme/utils/styles.dart';
import 'package:deneme/utils/colors.dart';
import 'package:deneme/routes/Welcome.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  int attemptCount;
  String mail;
  String password;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN',
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 5.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 250.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: AppColors.primary,
                                  filled: true,
                                  hintText: 'E-mail',
                                  hintStyle: kButtonTextStyle,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,

                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'Please enter your e-mail';
                                  }
                                  if(!EmailValidator.validate(value)) {
                                    return 'The e-mail address is not valid';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  mail = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        width: 250.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: AppColors.primary,
                                  filled: true,
                                  hintText: 'Password',
                                  hintStyle: kButtonTextStyle,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,

                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if(value.length < 8){
                                    return 'Password must be 8 characters';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  password = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        width: 180.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: () {
                                  if(_formKey.currentState.validate()) {
                                    _formKey.currentState.save();

                                    Scaffold.of(context).showSnackBar(const SnackBar(content: Text('Logging in')));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    'Login',
                                    style: kButtonLargeTextStyle,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 0.0, right: 5.0),
                        child: Divider(
                          color: AppColors.secondary,
                          height: 5.0,
                          thickness: 2.0,
                        ),
                      ),
                    ),
                    Text('OR',
                      style: kCaptionTextStyle,),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                        child: Divider(
                          color: AppColors.secondary,
                          height: 5.0,
                          thickness: 2.0,
                        ),
                      ),
                    ),
                  ],
                ), SizedBox(height: 30.0,),
                Text("Don't have an account?",
                  style: kCaptionTextStyle,),
                SizedBox(height: 15.0,),
                Container(
                  width: 180.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          onPressed:(){ Navigator.pushNamed(context, '/SignUp');},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Sign Up',
                              style: kButtonLargeTextStyle,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primary,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

