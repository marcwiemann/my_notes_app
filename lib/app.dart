import 'package:flutter/material.dart';
import 'style.dart';
import 'package:my_new_test_app/style.dart';
import 'Screens/home_screen.dart';
import 'Screens/notiz_detail.dart';
import "Screens/sign_in.dart";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      title: 'Notice',
      theme: _theme(),
    );
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
