import 'package:deneme/routes/SignUp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:deneme/utils/styles.dart';
import 'package:deneme/utils/colors.dart';
import 'package:deneme/main.dart';


class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String eMail;
  String name;
  String surname;
  String username;
  String passWord1;
  String passWord2;
  String confirm;
  final _formKey = GlobalKey<FormState>();

  Future<void> showAlertDialog(String title, String message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, //User must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(message),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('SIGN UP',
        style: kAppBarTextStyle,
      ),
      backgroundColor: AppColors.primary,
      centerTitle: true,
      elevation: 0.0,
    ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                                  hintText: 'Name',
                                  hintStyle: kMtrxW,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.secondary),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.text,

                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  if(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)){
                                    return "Name can't have special characters";
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  name = value;
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
                                  fillColor: AppColors.secondary,
                                  filled: true,
                                  hintText: 'Surname',
                                  hintStyle: kMtrxW,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.secondary),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.name,

                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'Please enter your surname';
                                  }
                                  if(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)){
                                    return "Surname can't have special characters";
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  surname = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),SizedBox(height: 10.0,),
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
                                  hintText: 'Email',
                                  hintStyle: kMtrxW,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.secondary),
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
                                  eMail = value;
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
                                  fillColor: AppColors.secondary,
                                  filled: true,
                                  hintText: 'Username',
                                  hintStyle: kMtrxW,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.secondary),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.text,

                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  if(value.length < 4){
                                    return 'Username too short';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  username = value;
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
                                  hintStyle: kMtrxW,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.secondary),
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
                                  passWord1 = value;
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
                                  fillColor: AppColors.secondary,
                                  filled: true,
                                  hintText: 'Confirm Password',
                                  hintStyle: kMtrxW,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.secondary),
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
                                  passWord2 = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        width: 180.0,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: () {
                                  if(_formKey.currentState.validate()) {
                                    _formKey.currentState.save();

                                    if(passWord1 != passWord2) {
                                      showAlertDialog("Error", 'Passwords must match');
                                    }
                                      else {
                                      //TODO: signUpUser();
                                    }

                                    Scaffold.of(context).showSnackBar(const SnackBar(content: Text('Signing up')));
                                  }
                                },
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
                SizedBox(height: 20.0,),
                Text('Sign Up using GOOGLE',
                  style: kCaptionTextStyle,
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: 180.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          onPressed: (){
                            //TODO: Link sign up with google
                          },
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

