import 'dart:async';
import 'package:flutter/material.dart';

import '../../../utilities/format_duration.dart';

class ShowTimerWidget extends StatefulWidget {
  final Duration initialDuration;

  ShowTimerWidget({required this.initialDuration});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<ShowTimerWidget> {
  late Duration remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialDuration;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime -= Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
        print("Timer finished!");
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${formatDuration(remainingTime)}", style: TextStyle(fontSize: 24)),
      ],
    );
  }
}