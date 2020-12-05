import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ppsc_helping_kit/src/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//Change end gradient color here
  var alignment1 = Alignment.bottomLeft;
  var alignment2 = Alignment.topRight;
  //NOTE  This function Count The Time Of splash screen
  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  //NOTE  This function Tell the Rout of next page
  route() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return HomePage();
    }));
  }

//NOTE  This function call and start the Timer
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(color: Colors.red
                // gradient: LinearGradient(
                //     begin: Alignment.bottomLeft,
                //     end: Alignment.topRight,
                //     colors: [Colors.indigo[900], Colors.lightBlueAccent])),
                )),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                )),
                // height: 150,
                width: 200),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Text("Welcome ...",
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text("powerdy by sherazii.com",
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
        ),
      ]),
    );
  }
}
