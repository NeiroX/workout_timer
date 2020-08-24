import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/set.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  int setCounter = 0;
  List<String> setNameList = [];
  List<Widget> setList = [];
  bool isEditing = false;

  void addSet() {
    setState(() {
      setCounter++;
      setNameList.add('Set $setCounter');
      setList.add(new Sets(name: 'Set $setCounter', id: setCounter - 1),
      );
    });
  }

  void removeSet(int id) {
    setState(() {
      setList.removeAt(id - 1);
      setNameList.removeAt(id - 1);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(
            'Workout Page',
            textAlign: TextAlign.left,
          ),
          backgroundColor: Colors.orange[600],
        ),
        body: ListView.builder(
            itemCount: setCounter,
            itemBuilder: (context, index) {
              return setList[index];
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: addSet,
          child: Icon(Icons.add, color: Colors.orange[600]),
          backgroundColor: Colors.blueGrey[400],
          splashColor: Colors.amber[600],
          mini: true,
          tooltip: 'Tap to add new set in your list',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked);
  }
}




















//Widget IconButtons(int id) {
//  const double iconSize = 10.0;
//
//  return Column(
//    mainAxisAlignment: MainAxisAlignment.center,
//    children: <Widget>[
//      Expanded(
//        child: FloatingActionButton(
//          child: Icon(
//            Icons.play_arrow,
//            color: Colors.greenAccent,
//            size: iconSize,
//          ),
//          onPressed: null,
//        ),
//      ),
//      Expanded(
//        child: FloatingActionButton(
//          child: Icon(
//            Icons.edit,
//            color: Colors.white54,
//            size: iconSize,
//          ),
//          onPressed: null,
//        ),
//      ),
//      Expanded(
//        child: FloatingActionButton(
//          child: Icon(
//            Icons.delete,
//            color: Colors.red,
//            size: iconSize,
//          ),
//          onPressed: () {
//            return removeSet(id);
//          },
//        ),
//      ),
//    ],
//  );
//}

