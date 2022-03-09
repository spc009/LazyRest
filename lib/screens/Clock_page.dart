import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_task_planner_app/screens/create_new_task_page.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';
import 'package:flutter_task_planner_app/widgets/Clock_timer.dart';
import 'package:flutter_task_planner_app/widgets/Get_courses.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../widgets/Clock_timer.dart';

class ClockDemo extends StatefulWidget {
  @override
  State<ClockDemo> createState() => _ClockDemoState();
}

class _ClockDemoState extends State<ClockDemo> {
  Timer _timer;
  int c;
  int temp;
  double p = 1.0;
  String s = "Pomodoro";
  Color colour = Color(0xFF000000);
  void _setClock(int t, Color color) {
    // showclock(10);
    t = t * 60;
    c = t;
    // print(c);
    // if (run) {
    //   _timer.cancel();
    //   running = false;
    //   t = null;
    // } else {
    //   running = true;
    // }
    colour = color;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (c > 1) {
          if (c % 60 == 0) {
            double b = (c / 60);
            int a = b.toInt();
            s = a.toString();
          }
          // s = c.toString();
          c--;
          p = c / t;
        } else if (c == 1) {
          c--;
          p = 1.0;
          colour = Color(0xFF000000);
          s = c.toString();
        } else {
          _timer.cancel();
          s = "Pomodoro";
          c = null;
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              Container(
                alignment: Alignment.center,
                child: ShowClock(p, s, colour),
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () => _setClock(25, Color(0xFF760006)),
                    child: CircularPercentIndicator(
                      radius: 35.0,
                      lineWidth: 0.0,
                      animation: true,
                      percent: 1,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xFFF5C287),
                      backgroundColor: LightColors.kDarkRed,
                      center: CircleAvatar(
                        backgroundColor: Color(0xFF760006),
                        radius: 35.0,
                      ),
                      footer: Text(
                        'Start Pomodoro',
                        style: TextStyle(
                          color: LightColors.kDarkGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () => _setClock(5, Color(0xFFFFc300)),
                    child: CircularPercentIndicator(
                      radius: 35.0,
                      lineWidth: 0.0,
                      animation: true,
                      percent: 1,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xFFF5C287),
                      backgroundColor: LightColors.kDarkRed,
                      center: CircleAvatar(
                        backgroundColor: Color(0xFFFFc300),
                        radius: 35.0,
                      ),
                      footer: Text(
                        'take a Break',
                        style: TextStyle(
                          color: LightColors.kDarkGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
