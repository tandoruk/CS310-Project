import 'package:flutter/material.dart';
import 'package:deneme/routes/Welcome.dart';
import 'package:deneme/utils/styles.dart';
import 'package:deneme/utils/colors.dart';
import 'package:deneme/routes/SignUp.dart';
import 'package:deneme/routes/LogIn.dart';

import 'dart:convert';
void main() => runApp(MaterialApp(
  home: Welcome(),
  initialRoute: '/WT',
  routes: {
    '/WT' : (context) => HomePage(),
    '/welcome' :(context) => Welcome(),
    '/LogIn' :(context) => LogIn(),
    '/SignUp' :(context) => SignUp(),
  },
));

int currPage = 1;
int totalPage = 4;
List<String>  top = ["GEV DM", "Talk To Friends", "Meet New People", "Get Started"];
List<String> bottom = ["Connecting People", "Send A DM", "Gain Followers", "Log In/Sign Up"];
String currName = "Walk Through";
String currTop = top[currPage-1];
String currBottom = bottom[currPage-1];
List<String> pics = ["https://4.bp.blogspot.com/-zCpZELyBepw/Ui7mQteZ8fI/AAAAAAAADtw/pvLlFY_SQeo/s1600/connecting+people.jpeg", "https://help.twitter.com/content/dam/help-twitter/en/twitter-tips/desktop-assets/chapter-4/new/ch-4-6-dm-icons.png.twimg.1920.png", "https://image.freepik.com/free-vector/marketing-magnet-engaging-followers-social-media-likes-follows-magnetism-influencer-advertise-strategy-vector-illustration_102902-566.jpg", "https://image.freepik.com/free-vector/hand-lettering-motivational-phrase-let-s-go-ink-painted-modern-calligraphy_83277-4900.jpg"];
String currImg = pics[currPage-1];

class HomePage extends StatefulWidget {
  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        title:  Text(
            "$currName",
            style: kAppBarTextStyle,
          ),


      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        child: Column(

          children: <Widget>[
            Padding(padding: EdgeInsets.all(20)),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "$currTop",
                    style: kTextStyle,
                ),
              ],
            ),
            SizedBox(height: 60),
           CircleAvatar(
             radius: 150,
             backgroundImage: NetworkImage(
                 "$currImg",
             ),
           ),
            SizedBox(height: 60),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$currBottom",
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

                  IconButton(


                      icon: const Icon(
                          Icons.arrow_left,
                        size: 30,
                      ),
                      onPressed: (){
                        if(currPage != 1){
                          setState(() {
                            currPage -=1;

                          });
                         // currName = names[currPage-1];
                          currTop = top[currPage-1];
                          currBottom = bottom[currPage-1];
                          currImg = pics[currPage-1];
                        }
                      }
                  ),
                  SizedBox(width: 30),
                  Text(
                    "$currPage",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 30),
                  IconButton(

                      icon: const Icon(
                        Icons.arrow_right,
                        size: 30,
                      ),
                      onPressed: (){
                        if(currPage != 4){
                          setState(() {
                            currPage += 1;

                          });
                         // currName = names[currPage-1];
                          currTop = top[currPage-1];
                          currBottom = bottom[currPage-1];
                          currImg = pics[currPage-1];
                        }

                      }
                  ),
                  SizedBox(width: 30),
                  Visibility(

                      visible: (currPage == 4),
                      child: RaisedButton(

                        child: Text(
                          "Welcome Page",
                          style: kButtonTextStyle,
                        ),
                        onPressed: (){
                          if(currPage == 4){
                            Navigator.pushNamed(context, '/welcome');
                          }


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


