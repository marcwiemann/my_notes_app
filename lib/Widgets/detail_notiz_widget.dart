import 'package:flutter/material.dart';
import '../style.dart';

TextEditingController changeDetailText = TextEditingController();
TextEditingController changeDetailBodyText = TextEditingController();

class FullNotiz extends StatefulWidget {

  //Variablen
  final String _title;
  final String _body;

  FullNotiz(this._title, this._body);

  @override
  _FullNotizState createState() => _FullNotizState();
}

class _FullNotizState extends State<FullNotiz> {




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Container(
            decoration: trennStrich(),
            padding: EdgeInsets.fromLTRB(24.0, 32.0, 32.0, 16.0),
            child:_alertTitleText(),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24.0, 32.0, 32.0, 4.0),
            child: _alertBodyText(),
          ),
        ],
      ),
    );
  }

  Widget _alertTitleText() {
    changeDetailText.text = widget._title;
    return TextField(      
      style: TextStyle(
        fontFamily: 'Jost',
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      controller: changeDetailText,
      decoration: InputDecoration(
        hintText: "Title",
        border: InputBorder.none,
        filled: false,
        contentPadding: new EdgeInsets.only(
            left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
      ),
    );
  }

  Widget _alertBodyText() {
    changeDetailBodyText.text = widget._body;
    return TextField(
      style: TextStyle(
        fontFamily: 'Jost',
        fontWeight: FontWeight.w300,
        fontSize: 18,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: changeDetailBodyText,
      decoration: InputDecoration(
        hintText: "Deine Notiz",
        border: InputBorder.none,
        filled: false,
        contentPadding: new EdgeInsets.only(
            left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
      ),
    );
  }

  
}
