import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class SignUp extends StatefulWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool _errorWeakPassword = false;
  bool _errorEmailUse = false;

  Future<bool> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        _errorWeakPassword = true;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        _errorEmailUse = true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _headingLabel(),
          _signInLabel(),
        ],
      ),
    );
  }

  Widget _headingLabel() {
    return Positioned(
      height: 200,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15.0),
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.blue,
                  Colors.lightBlue,
                ])),
        child: Center(
          child: Text(
            'Notice \nyour App for your Notes',
            textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: "roboto",
                fontSize: 28,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _signInLabel() {
    return Positioned(
      height: MediaQuery.of(context).size.height / 1.5,
      top: 180,
      left: 25,
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            loginText(),
            userNameField(),
            passwordField(),
            loginButton(),
            Text(
              "OR",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            registerButton(),
            socialLogin(),
            if (_errorEmailUse == true)
              Text(
                "E-Mail wird schon benutzt",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.red,
                ),
              )
            else if (_errorWeakPassword == true)
              Text(
                "E-Mail wird schon benutzt",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.red,
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget loginText() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text("Register your Account",
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Color.fromRGBO(0, 179, 255, 1),
              fontSize: 30,
              fontWeight: FontWeight.w700,
              fontFamily: "roboto")),
    );
  }

  Widget userNameField() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextField(
        controller: userController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black,
          ),
          labelText: "E-Mail",
          labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 8.0),
      child: TextField(
        controller: pwController,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          labelText: "Password",
          labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: ButtonTheme(
        minWidth: 250.0,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          color: Colors.lightBlueAccent,
          onPressed: () async {
            if (await userController.text != null ||
                pwController.text != null) {
              if (registerWithEmail(userController.text, pwController.text) ==
                  true) {
                Navigator.pushNamed(context, '/home');
              }
            }
          },
          textColor: Colors.white,
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Sign Up',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }

  Widget registerButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
      child: ButtonTheme(
        minWidth: 250.0,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/signin');
          },
          textColor: Colors.white,
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Login',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlueAccent)),
          ),
        ),
      ),
    );
  }

  Widget socialLogin() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.00),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/images/google.png'),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/images/facebook.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
