
import 'package:flutter/cupertino.dart';

class User{
  int  userID;
  String  username;
  String  image;
  String  prename;
  String  surname;
  String  email;
  DateTime birthday;


  User({
    @required this. userID, 
    @required this. email,
    @required this. username, 
    this. birthday, 
    this. prename, 
    this. surname, 
    this. image
    });
}