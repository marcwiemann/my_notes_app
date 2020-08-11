import 'package:flutter/material.dart';
import '../style.dart';

class LittleNotiz extends StatelessWidget {
  final String _title;
  final String _body;

  LittleNotiz(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0 ,16.0, 15.0, 0.0),
      decoration: boxDecorationList(),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: trennStrich(),
          padding: EdgeInsets.fromLTRB(32.0, 4.0, 32.0, 2.0),
          child: Text(_title, style: Theme.of(context).textTheme.headline6,
          ),
          ),
        Container(
          padding: EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 4.0),
          child: Text(_body, style: Theme.of(context).textTheme.bodyText2,),
          ),
      ],
    ),
    );
    
  }
}