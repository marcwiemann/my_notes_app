import 'package:flutter/material.dart';
import 'package:my_new_test_app/Widgets/detail_notiz_widget.dart';
import '../models/notizList.dart';

class DetailNotiz extends StatefulWidget {
  const DetailNotiz({Key key, @required this.notizID}) : super(key: key);
  final int notizID;

  @override
  _DetailNotizState createState() => _DetailNotizState();
}

class _DetailNotizState extends State<DetailNotiz> {
  @override
  void initState() {
    super.initState();
  }

  bool _deletePressed = false;
  bool _heartPressed = false;

  final GlobalKey<NotizListeState> key = GlobalKey<NotizListeState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: NotizListe(
          key: key,
          notizid1: widget.notizID,
        ),
      ),
      floatingActionButton: _checkedButton(),
    );
  }

  Widget _heartButton() {
    return Padding(
      padding: EdgeInsets.only(right: 5.0, left: 10.0),
      child: IconButton(
          icon: new Icon(
            _heartPressed ? Icons.favorite_border : Icons.favorite,
            size: 40,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              print(_heartPressed);
              _heartPressed = !_heartPressed;
            });
          }),
    );
  }

  Widget _deleteButton() {
    return Padding(
        padding: EdgeInsets.only(right: 20.0, left: 5.0),
        child: IconButton(
            onPressed: () {
              key.currentState.deleteItemOnList(widget.notizID);
              setState(() {});
              Navigator.pushNamed(context, '/');
            },
            icon: new Icon(
              Icons.delete,
              size: 40,
              color: Colors.blueGrey,
            )));
  }

  Widget _appBar() {
    return AppBar(
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _heartButton(),
            _deleteButton(),
          ],
        ),
      ],
    );
  }

  Widget _checkedButton() {
    return FloatingActionButton(
      child: Icon(Icons.check),
      backgroundColor: Colors.lightBlue,
      onPressed: () {
        key.currentState.editItemOnList(
            widget.notizID, changeDetailText.text, changeDetailBodyText.text);
        setState(() {});
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
