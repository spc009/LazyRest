import 'dart:ffi';

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task_planner_app/widgets/Course_detail.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:synchronized/synchronized.dart';
import 'package:flutter_task_planner_app/screens/Task_page.dart';

class ShowClock extends StatelessWidget {
  final double remain;
  final String s;
  final Color color;
  var lock = Lock();
  // List<Color> color = [
  //   LightColors.kGreen,
  //   LightColors.kRed,
  //   LightColors.kYellow,
  //   LightColors.kDarkRed,
  // ];

  ShowClock(this.remain, this.s,this.color);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 150.0,
      lineWidth: 20,
      animation: false,
      percent: remain,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: color,
      backgroundColor: LightColors.kLightGreen,
      center: CircleAvatar(
        backgroundColor: color.withOpacity(0.8),
        radius: 132.0,
        // ),
        child: Text(
          s,
          style: TextStyle(
            fontSize: 50.0,
            color: LightColors.kLightYellow,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
