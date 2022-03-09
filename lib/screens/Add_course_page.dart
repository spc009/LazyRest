import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/Header.dart';
import 'package:flutter_task_planner_app/widgets/add_course_form.dart';
import 'package:flutter_task_planner_app/widgets/calendar.dart';
import 'package:flutter_task_planner_app/widgets/task_container.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';
import 'package:flutter_task_planner_app/screens/create_new_task_page.dart';
import 'package:flutter_task_planner_app/widgets/Date.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';

class AddCoursePage extends StatelessWidget {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Container(
                        alignment: Alignment(0.8, 1.0),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            AddCourseForm(
                              cardColor: LightColors.kYellow,
                              loadingPercent: 0.9,
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
