import 'package:workout_timer/constants.dart';
import 'package:flutter/material.dart';

class WorkoutElement extends StatefulWidget {
  WorkoutElement({this.minutes, this.seconds, this.type});

  final int minutes;
  final int seconds;
  final String type;

  @override
  _WorkoutElementState createState() => _WorkoutElementState();
}

class _WorkoutElementState extends State<WorkoutElement> {
  String timeText = '';
  int minutes;
  int seconds;
  String type;

  void initState() {
    super.initState();
    minutes = widget.minutes;
    seconds = widget.seconds;
    type = widget.type;
  }

  void getValideTimeText() {
    setState(() {
      timeText = '';
      if (minutes ~/ 10 == 0) {
        timeText += '\0$minutes:';
      } else {
        timeText += '$minutes:';
      }
      if (seconds ~/ 10 == 0) {
        timeText += '\0$seconds';
      } else {
        timeText += '$seconds';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
