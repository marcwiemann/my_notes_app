import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_new_test_app/Screens/sign_in.dart';
import 'style.dart';
import 'package:my_new_test_app/style.dart';
import 'Screens/home_screen.dart';
import 'Screens/notiz_detail.dart';
import "Screens/splashscreen.dart";
import "Screens/registration.dart";

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text('Hier ist etwas schief gelaufen!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ));
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              onGenerateRoute: _routes(),
              title: 'Notice',
              theme: _theme(),
            );
          }
          return CircularProgressIndicator();
        });
  }
}

ThemeData _theme() {
  return ThemeData(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
    textTheme: TextTheme(bodyText2: Body1Style, headline6: Title1Sytle),
  );
}

RouteFactory _routes() {
  return (settings) {
    final Map<String, dynamic> args = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case '/':
        screen = MySplash();
        return MaterialPageRoute(builder: (BuildContext context) => screen);
        break;
      case '/signup':
        screen = SignUp();
        return MaterialPageRoute(builder: (BuildContext context) => screen);
        break;
      case '/signin':
        screen = SignIn();
        return MaterialPageRoute(builder: (BuildContext context) => screen);
        break;
      case '/detailNotiz':
        screen = DetailNotiz(notizID: args['id']);
        return MaterialPageRoute(builder: (BuildContext context) => screen);
        break;
      case '/home':
        screen = Test();
        return MaterialPageRoute(builder: (BuildContext context) => screen);
        break;
      default:
        return null;
    }
  };
}
