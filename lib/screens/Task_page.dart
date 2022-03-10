import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/Course_detail.dart';
import 'package:flutter_task_planner_app/widgets/Get_assignment.dart';
import 'package:flutter_task_planner_app/widgets/Header.dart';
import 'package:flutter_task_planner_app/widgets/add_course_form.dart';
import 'package:flutter_task_planner_app/widgets/calendar.dart';
import 'package:flutter_task_planner_app/widgets/task_container.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';
import 'package:flutter_task_planner_app/screens/Clock_page.dart';
import 'package:flutter_task_planner_app/widgets/Date.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';

class TaskPage extends StatelessWidget {
  final Color cardColor;
  final double loadingPercent;
  final String title;
  final String id;

  TaskPage({
    this.cardColor,
    this.loadingPercent,
    this.title,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
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
              SizedBox(height: 20),
              Container(
                // color: cardColor,
                alignment: Alignment(-0.5, 1),
                padding: EdgeInsets.zero,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: LightColors.kLightYellow,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                // color: cardColor,
                alignment: Alignment(-0.85, 1),
                padding: EdgeInsets.zero,
                child: Text(
                  id,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: LightColors.kLightYellow,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Get_assignment(id),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
