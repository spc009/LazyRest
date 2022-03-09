import 'package:flutter_task_planner_app/widgets/Add_course.dart';
import 'package:flutter_task_planner_app/widgets/Get_courses.dart';
import 'package:flutter_task_planner_app/widgets/Date.dart';
import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:flutter_task_planner_app/screens/Add_course_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/screens/calendar_page.dart';
import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:flutter_task_planner_app/widgets/Header.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/task_column.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
// import 'package:flutter_task_planner_app/widgets/top_container.dart';
// import 'package:flutter_task_planner_app/widgets/calendar_dates.dart';
import 'package:flutter_task_planner_app/widgets/Get_courses.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:synchronized/synchronized.dart';

class Courses extends StatelessWidget {
  get width => null;
  var lock = new Lock();
  Courses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFD),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(3,0,3,3),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              HomePage.subheading('My Tasks'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: HomePage.calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: LightColors.kPalePink,
                            title: 'To Do',
                            subtitle: '5 tasks now. 1 started',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'In Progress',
                            subtitle: '1 tasks now. 1 started',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: LightColors.kDarkRed,
                            title: 'Done',
                            subtitle: '18 tasks now. 13 started',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Get_courses(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
