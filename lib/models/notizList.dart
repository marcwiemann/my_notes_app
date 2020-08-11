import 'package:flutter/material.dart';
import 'notiz.dart';
import '../Widgets/little_notiz_widget.dart';
import '../Widgets/detail_notiz_widget.dart';

class NotizListe extends StatefulWidget {
  NotizListe({Key key, this.notizid1}) : super(key: key);
  final int notizid1;
  @override
  NotizListeState createState() => NotizListeState();
}

class NotizListeState extends State<NotizListe> {

  //Liste 
  static List<Notiz> notizList = [
    Notiz(
        1,
        'Marc',
        "Haus am Meer",
        "Ein Haus am Meer, das wünsche ich mir und dann trinke ich drei Flaschen Bier.",
        "01.05.2020", false),
    Notiz(2, "Marc", "Audi Rs7", 'Audi RS7 mmit 600ps, Kaufpreis: 170.000 Euro',
        "03.05.2020", false),
    Notiz(3, "Marc", "Audi Rs3", 'Audi RS7 mmit 600ps, Kaufpreis: 170.000 Euro',
        "03.05.2020", false),
    Notiz(4, "Marc", "Audi Rs7", 'Audi RS3 mmit 600ps, Kaufpreis: 110.000 Euro',
        "04.05.2020", false ),
    Notiz(5, "Marc", "Limonen Tee", 'Leckerer Limonen Zitronen Tee',
        "04.05.2020", true),
  ];

  //Funtkion zum hinzufügen in die Liste
  void addToList(String title, String body) {
    int index = notizList.length + 1;
    Notiz element = Notiz(index, 'Marc', title, body, '05.05.2020', false);
    notizList.add(element);
  }

  //schaut ob eine Notiz geliked ist
  bool likedHeart(int notizID){
    int i = fetchByResults(notizID);
    
    if(notizList[i].liked = true){
      return true;
    }
    return false;
  }

  void clickHeart(int notizID){
    int i = fetchByResults(notizID);
    print(notizList[i].liked);
    notizList[i].liked = !notizList[i].liked ;
    print(notizList[i].liked);
  }

  //Löscht ein Item in einer Liste
  void deleteItemOnList(int notizID){
    print('Parameter: '+notizID.toString());
    int i =fetchByResults(notizID);
    printList();
    notizList.removeAt(i);
    
  }

  //Editiert ein Item in einer Liste
  void editItemOnList(int notizID, String title, String body){
    print('Parameter: '+notizID.toString());
    Notiz n = fetchByID(notizID);
    print('Notiz ID: '+n.id.toString());
    n.body = body;
    n.title = title;
    notizList.replaceRange(notizID, notizID, [n]);
    notizList.removeAt(notizID);
    printList();
    
  }

  //Liste ausgeben
  void printList(){
    print("Notiz Liste");
    for (var i = 0; i < notizList.length; i++) {
      print("ID: "+notizList[i].id.toString());
      print("Title: "+notizList[i].title);
      print("ID: "+notizList[i].body);
    }
  }

  //Funktion für eine Notiz in der Liste
  Notiz fetchByID(int notizID) {
    print('Die Länge der notiz Liste: ' + notizList.length.toString());
    print(notizID);
    for (var i = 0; i < notizList.length; i++) {
      if (notizList[i].id == notizID) {
        return notizList[i];
      }
    }
    return notizList[1];
  }

  //Funktion für eine Notiz in der Liste
  int fetchByResults(int notizID) {
    print('Die Länge der notiz Liste: ' + notizList.length.toString());
    print(notizID);
    for (var i = 0; i < notizList.length; i++) {
      if (notizList[i].id == notizID) {
        return i;
      }
    }
    return 0;
  }

  //Build Methode
  @override
  Widget build(BuildContext context) {
    if (widget.notizid1 != null) {
      return fullNotizView(context, widget.notizid1);
    } else {
      return notizenListView(context, notizList);
    }
  }

  //Full Notiz View
  Widget fullNotizView(BuildContext context, notizid) {
    Notiz notiz = this.fetchByID(notizid);
    return Container(child: FullNotiz(notiz.title, notiz.body));
  }

  // ListeView für alle Notizen
  Widget notizenListView(BuildContext context, List<Notiz> notizList) {
    return ListView.builder(
      itemCount: notizList.length,
      itemBuilder: (context, index) => _itemBuilder(context, notizList[index]),
    );
  }
  
}

_onNotizTap(BuildContext context, int notizenId) {
  Navigator.pushNamed(context, '/detailNotiz', arguments: {"id": notizenId});
}

Widget _itemBuilder(BuildContext context, Notiz notizen) {
  return GestureDetector(
      onTap: () => _onNotizTap(context, notizen.id),
      key: Key('notizen_list_item_${notizen.id}'),
      child: Container(
        child: LittleNotiz(notizen.title, notizen.body),
      ));
}


