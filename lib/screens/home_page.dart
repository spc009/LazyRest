// import 'package:flutter_task_planner_app/widgets/Date.dart';
import 'dart:ffi';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_task_planner_app/widgets/Get_courses.dart';
import 'package:flutter_task_planner_app/widgets/Header.dart';
import 'package:flutter_task_planner_app/widgets/get_time.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/screens/calendar_page.dart';

import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/task_column.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
// import 'package:flutter_task_planner_app/widgets/calendar_dates.dart';
// import 'package:flutter_task_planner_app/widgets/Date.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/widgets/task_container.dart';

class HomePage extends StatefulWidget {
  static Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkGreen,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  DatePickerController cr;

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kLightGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedValue = DateTime.now();
  var Day = DateTime.now().weekday;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFD),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(0, 3, 3, 3),
            SizedBox(height: 20),
            //
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime.now(),
                    width: 50,
                    height: 100,
                    initialSelectedDate: _selectedValue,
                    selectionColor: LightColors.kGreen,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                        Day = _selectedValue.weekday;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Container(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         // SizedBox(height: 30),
            //         // Container(
            //         //   child: Row(
            //         //     mainAxisAlignment: MainAxisAlignment.center,
            //         //     // crossAxisAlignment: CrossAxisAlignment.center,
            //         //     children: [
            //         //       // SizedBox(width: 50),
            //         //       TaskColumn(
            //         //         icon: Icons.blur_circular,
            //         //         iconBackgroundColor: LightColors.kRed,
            //         //         title: 'Credit :',
            //         //         subtitle: '100 credits',
            //         //       ),
            //         //       SizedBox(width: 60),
            //         //       TaskColumn(
            //         //         icon: Icons.blur_circular,
            //         //         iconBackgroundColor: LightColors.kRed,
            //         //         title: 'Credit :',
            //         //         subtitle: '100 credits',
            //         //       ),
            //         //     ],
            //         //   ),
            //         // ),
            //         // SizedBox(height: 30),
            //       ],
            //     ),
            //   ),
            // ),
            Get_time(Day),
          ],
        ),
      ),
    );
  }
}
