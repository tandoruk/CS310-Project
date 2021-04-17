import 'package:deneme/utils/colors.dart';
import 'package:deneme/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:deneme/main.dart';
import 'package:deneme/routes/SignUp.dart';
import 'package:deneme/routes/LogIn.dart';



class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();

}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
            "WELCOME :)",
            style: kAppBarTextStyle,
          ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(

          children: <Widget>[
            Padding(padding: EdgeInsets.all(20)),

            SizedBox(height: 60),
            CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(
                "https://pyxis.nymag.com/v1/imgs/4db/9a9/78f0f50285dd11bef4946bc47283e49281-pills-lede.rhorizontal.w1200.jpg"
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Red or Blue Pill?",
                  style: kTextStyle,
                ),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              flex: 1,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    buttonColor: Colors.grey[400],
                      minWidth: 120.0,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          "Sign Up",
                          style: kMtrxR,

                        ),
                        onPressed: (){
                          //print("Log In pressed");
                          Navigator.pushNamed(context, '/SignUp');
                        },

                      ),
                  ),




                  SizedBox(width: 50),
                  ButtonTheme(
                    buttonColor: Colors.grey[400],
                      minWidth: 120.0,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          "Log In",
                          style: kMtrxB,
                        ),
                        onPressed: (){
                          //print("Sign Up pressed");
                          Navigator.pushNamed(context, '/LogIn');
                        },

                      ),
                  ),

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
