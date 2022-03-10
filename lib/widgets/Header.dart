import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/screens/calendar_page.dart';
import 'package:flutter_task_planner_app/screens/Courses_page.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/task_column.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
import 'package:flutter_task_planner_app/widgets/Get_courses.dart';
import 'package:flutter_task_planner_app/screens/Add_course_page.dart';

class Header extends StatelessWidget {
  final double H;
  final double C;
  final double M;
  final double L;

  Header(this.H, this.C, this.M, this.L);

  Widget build(BuildContext context) {
    var width;
    return TopContainer(
      height: 100,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: CircularPercentIndicator(
                    radius: 28.0,
                    lineWidth: H,
                    animation: false,
                    percent: 1,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.black,
                    backgroundColor: LightColors.kDarkRed,
                    center: CircleAvatar(
                      backgroundColor: LightColors.kLightYellow,
                      radius: 25.0,
                      child: Icon(
                        Icons.home,
                        size: 30.0,
                        color: LightColors.kDarkGreen,
                      ),
                    ),
                    footer: Text(
                      'Home',
                      style: TextStyle(
                        color: LightColors.kLightYellow,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Courses()),
                    );
                  },
                  child: CircularPercentIndicator(
                    radius: 28.0,
                    lineWidth: C,
                    animation: false,
                    percent: 1,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.black,
                    backgroundColor: LightColors.kDarkRed,
                    center: CircleAvatar(
                      backgroundColor: LightColors.kLightYellow,
                      radius: 25.0,
                      child: Icon(
                        Icons.library_books,
                        size: 30.0,
                        color: LightColors.kDarkGreen,
                      ),
                    ),
                    footer: Text(
                      'Courses',
                      style: TextStyle(
                        color: LightColors.kLightYellow,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => AddCoursePage()),
                //     );
                //   },
                //   child: CircularPercentIndicator(
                //     radius: 28.0,
                //     lineWidth: M,
                //     animation: false,
                //     percent: 1,
                //     circularStrokeCap: CircularStrokeCap.round,
                //     progressColor: Colors.black,
                //     backgroundColor: LightColors.kRed2,
                //     center: CircleAvatar(
                //       radius: 25.0,
                //       backgroundColor: LightColors.kLightYellow,
                //       child: Icon(
                //         Icons.person,
                //         size: 30.0,
                //         color: LightColors.kDarkGreen,
                //       ),
                //     ),
                //     footer: Text(
                //       'Supatcha',
                //       style: TextStyle(
                //         color: LightColors.kLightYellow,
                //         fontSize: 16,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCoursePage()),
                    );
                  },
                  child: CircularPercentIndicator(
                    radius: 28.0,
                    lineWidth: L,
                    animation: false,
                    percent: 1,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.black,
                    backgroundColor: LightColors.kDarkRed,
                    center: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: LightColors.kLightYellow,
                      child: Icon(
                        Icons.logout,
                        size: 30.0,
                        color: LightColors.kDarkGreen,
                      ),
                    ),
                    footer: Text(
                      'Logout',
                      style: TextStyle(
                        color: LightColors.kLightYellow,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
