import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task_planner_app/screens/Add_course_page.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/screens/Courses_page.dart';

class AddCourse extends StatelessWidget {
  final String CourseID;
  final String CourseTitle;
  // final int age;

  AddCourse(this.CourseID, this.CourseTitle);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called course that references the firestore collection
    Firebase.initializeApp();
    CollectionReference course =
        FirebaseFirestore.instance.collection('Courses');

    Future addCourse() async {
      print("add data to table");
      // Call the user's CollectionReference to add a new user

      course
          .doc(CourseID) // <-- Document ID
          .set({'title': CourseTitle}) // <-- Your data
          .then((_) => print('Added'))
          .catchError((error) => print('Add failed: $error'));
    }

    print("we at courses");
    addCourse();
    return FutureBuilder(
        future: addCourse(),
        // ignore: missing_return
        builder: (context, snapshot) {
          print("go to course");
          // AddCourse(CourseID, CourseTitle);
          Courses();
        });
  }
}
