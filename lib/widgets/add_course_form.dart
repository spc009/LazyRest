import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/screens/Add_course_page.dart';
import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_task_planner_app/widgets/Add_course.dart';

class AddCourseForm extends StatefulWidget {
  final Color cardColor;
  final double loadingPercent;
  static String title = "";
  static String id = "";

  AddCourseForm({
    this.cardColor,
    this.loadingPercent,
    // this.title,
    // this.ID,
  });

  @override
  State<AddCourseForm> createState() => _AddCourseFormState();
}

class _AddCourseFormState extends State<AddCourseForm> {
  String text = "No Value Entered";

  void _setText() {
    // AddCourse(AddCourseForm.id, AddCourseForm.title);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    print(AddCourseForm.title);
    // setState(() {
    //   // text = AddCourseForm.title;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(15.0),
        height: 200,
        decoration: BoxDecoration(
          color: widget.cardColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Student ID',
                  ),
                  onChanged: (value) => {
                        print(value),
                        AddCourseForm.title = value,
                      }),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //   child: TextField(
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         hintText: 'Enter Course ID',
            //       ),
            //       onChanged: (value) => {
            //             print(value),
            //             AddCourseForm.id = value,
            //           }),
            // ),
            RaisedButton(
              onPressed: _setText,
              child: Text('Log in'),
              elevation: 8,
            ),
          ],
        ),
      ),
    );
  }
}
