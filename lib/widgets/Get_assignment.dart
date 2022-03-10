import 'dart:ffi';

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task_planner_app/widgets/Course_detail.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:synchronized/synchronized.dart';
import 'package:flutter_task_planner_app/screens/Task_page.dart';

import '../screens/Clock_page.dart';

class Get_assignment extends StatelessWidget {
  List<ActiveProjectsCard> card = [];
  // List<String> Path = [];
  final String id;
  Get_assignment(this.id);

  var lock = Lock();
  List<Color> color = [
    LightColors.kGreen,
    LightColors.kRed,
    LightColors.kDarkPink,
    LightColors.kYellow,
  ];

  static CircleAvatar btn() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kBlue,
      child: Icon(
        Icons.add,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Future<DocumentSnapshot> getPath() {
    //   Firebase.initializeApp();
    //   return FirebaseFirestore.instance
    //       .collection('/Users/600610788/Courses/2-2564/id')
    //       .get()
    //       // ignore: missing_return
    //       .then((QuerySnapshot querySnapshot) {
    //     int i = 0;
    //     querySnapshot.docs.forEach((doc) {
    //       // id.add(doc.id.toString());
    //       // title.add(doc["title"]);
    //       String path = 'Courses/' + doc.id.toString() + '/Schedule';
    //       Path.add(path);
    //       i++;
    //     });
    //   });
    // }

    Future<DocumentSnapshot> getAssignment(String path) {
      Firebase.initializeApp();
      return FirebaseFirestore.instance.collection(path).get()
          // ignore: missing_return
          .then((QuerySnapshot querySnapshot) {
        int i = 0;
        querySnapshot.docs.forEach((doc) {
          card.add(ActiveProjectsCard(
            cardColor: color[(i) % 4],
            loadingPercent: 0.45,
            title: doc["title"],
            id: doc.id.toString(),
          ));
          print(doc.id.toString());
          i++;
        });
      });
    }

    Future T() async {
      // await getPath();
      String Path = '/Courses/' + id + '/Assignment';
      // for (int i = 0; i < Path.length; i++) {
      //   await getAssignment(Path[i]);
      // }
      await getAssignment(Path);
    }

    return FutureBuilder(
        future: T(),
        builder: (context, snapshot) {
          // print(card);
          List<Widget> C = [];
          C.add(new Row(
            children: <Widget>[
              HomePage.subheading('Active Courses'),
            ],
          ));
          C.add(SizedBox(height: 5.0));

          for (int i = 0; i < card.length; i++) {
            C.add(
              Container(
                alignment: Alignment(0.8, 1.0),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClockDemo()));
                      },
                      child: CourseDetail(
                        cardColor: LightColors.kLightYellow,
                        loadingPercent: 0.45,
                        title: card[i].title,
                        id: id,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: C,
          );
        });
  }
}
