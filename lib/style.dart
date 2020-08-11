import 'dart:ui';

import 'package:flutter/material.dart';

const String FontNameDefault = 'Jost';

const Body1Style = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 16.0,
  color: Colors.black,
);

const Title1Sytle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w700,
  fontSize: 24.0,
  color: Colors.black,
);
 const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 26.0,
  color: Colors.black,
);

BoxDecoration boxDecorationList(){
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 4.0,
        spreadRadius: 4.0,
        offset: Offset(0.0, 7.0)
        )
    ],
    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
    border: Border.all(
      width: 1,
      color: Colors.black
    ),
  );
}
BoxDecoration trennStrich(){
  return BoxDecoration(
    border: Border(
      bottom: BorderSide(
        width:0.5, 
        color:Colors.grey
      )
    )
  );
}

BoxDecoration boxDecorationFull(){
  return BoxDecoration(
    border: Border.all(
      width: 1,
      color: Colors.black
    ),
  );
}