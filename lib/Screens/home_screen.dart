import 'package:flutter/material.dart';
import 'package:my_new_test_app/models/notizList.dart';
import '../models/notizList.dart';
import '../Widgets/side_bar.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  
  @override
  void setState(fn) {
    super.setState(fn);
  }
  final GlobalKey<NotizListeState> _key = GlobalKey();
  TextEditingController _textTitleField = TextEditingController();
  TextEditingController _textBodyField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(centerTitle: true, title: Text('Feed')),
      body: NotizListe(key: _key),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _displayDialog(context),
      ),
    );
  }

  Widget _alertTitleText() {
    return TextField(
      controller: _textTitleField,
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
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: _textBodyField,
      decoration: InputDecoration(
        hintText: "Deine Notiz",
        border: InputBorder.none,
        filled: false,
        contentPadding: new EdgeInsets.only(
            left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
      ),
    );
  }

  Widget _alertButton() {
    return SizedBox(
      width: 320.0,
      child: Center(
        child: SizedBox(
          width: 200.0,
          height: 40.0,
          child: FlatButton(
            hoverColor: Colors.grey,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Text('Hinzufügen'),
            onPressed: () {
              _key.currentState
                  .addToList(_textTitleField.text, _textBodyField.text);
              setState(() {});
              _textBodyField.clear();
              _textTitleField.clear();
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

  Widget _alertDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      title: Text('Trag deine Notizen ein.'),
      content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        _alertTitleText(),
        _alertBodyText(),
      ]),
      actions: <Widget>[
        _alertButton(),
      ],
    );
  }

  _displayDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return _alertDialog();
        });
  }
}
