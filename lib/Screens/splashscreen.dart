import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import "sign_in.dart";

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        'Notice \nyour App for your Notes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      seconds: 5,
      navigateAfterSeconds: SignIn(),
      image: Image.asset('assets/images/hiclipart_white.png'),
      photoSize: 100,
      backgroundColor: Colors.lightBlue,
      loaderColor: Colors.orange,
    );
  }
}
