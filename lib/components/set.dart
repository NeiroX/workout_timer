import 'package:flutter/material.dart';
import 'package:workout_timer/constants.dart';
import 'package:workout_timer/workout.dart';
import 'workout_element.dart';

class Sets extends StatefulWidget {
  Sets({@required this.name, @required this.id});

  final String name;
  final int id;

  @override
  _SetsState createState() => _SetsState();
}

class _SetsState extends State<Sets> {
  int iterations = 1;
  List<WorkoutElement> workoutElements = [];

  void addElement() {
    setState(() {
      workoutElements
          .add(new WorkoutElement(minutes: 10, seconds: 10, type: 'Work'));
    });
  }

  void degreaseIterations() {
    setState(() {
      iterations--;
    });
  }

  void increaseIterations() {
    setState(() {
      iterations++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.rectangle),
            margin: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: setsTitleStyle,
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                          icon: Icon(Icons.remove_circle_outline, size: 22),
                          onPressed: degreaseIterations,
                          color: Colors.redAccent[400]),
                      Text('Iterations: $iterations',
                          style: setsIterStyle, textAlign: TextAlign.right),
                      IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 22,
                          ),
                          onPressed: increaseIterations,
                          color: Colors.greenAccent[400]),
                      PaddingPopUp(
                        setID: widget.id,
                      ),
                    ],
                  ),
                  SetDivider(),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: workoutElements),
                  SetDivider(),
                  FlatButton.icon(
                    color: Colors.blueGrey[900],
                    label: Text(
                      'Add new element',
                      style: setsAddElement,
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.add_circle, color: Colors.orange[900]),
                    onPressed: addElement,
                  ),
                ]))
      ],
    );
  }
}

class PaddingPopUp extends StatefulWidget {
  PaddingPopUp({this.setID});

  final int setID;

  @override
  _PaddingPopUpState createState() => _PaddingPopUpState();
}

class _PaddingPopUpState extends State<PaddingPopUp> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: Colors.grey[800],
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: FlatButton.icon(
              icon: Icon(Icons.edit, color: Colors.white60),
              label: Text('Rename', style: setsPopMenuEdit),
              onPressed: null,
            )),
        PopupMenuItem(
            value: 2,
            child: FlatButton.icon(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              label: Text('Delete', style: setsPopMenuDelete),
              onPressed: null,
            )),
      ],
      elevation: 2,
      icon: Icon(
        Icons.more_vert,
        color: Colors.white54,
      ),
    );
  }
}

class SetDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.blueGrey[700],
      thickness: 1.25,
      indent: 2.0,
      endIndent: 2.0,
    );
  }
}
