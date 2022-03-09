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
import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/widgets/task_container.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Get_time extends StatelessWidget {
  List<TaskContainer> card = [];
  List<String> Path = [];
  List<String> id = [];
  List<String> title = [];
  final Day;
  // String title = "OS";
  // String id = "261305";
  String start = "09.30 am";
  String end = "11.00 am";

  var lock = Lock();
  List<Color> color = [
    LightColors.kGreen,
    LightColors.kRed,
    LightColors.kYellow,
    LightColors.kDarkRed,
  ];

  Get_time(this.Day);

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
    Widget _dashedText() {
      return Container(
          padding: EdgeInsets.symmetric(),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              '------------------------------------------',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20.0, color: LightColors.kBlue, letterSpacing: 5),
            ),
          ));
    }

    Future<DocumentSnapshot> getPath() {
      Firebase.initializeApp();
      return FirebaseFirestore.instance.collection('Courses').get()
          // ignore: missing_return
          .then((QuerySnapshot querySnapshot) {
        int i = 0;
        querySnapshot.docs.forEach((doc) {
          id.add(doc.id.toString());
          title.add(doc["title"]);
          String path = 'Courses/' + doc.id.toString() + '/Schedule';
          Path.add(path);
          i++;
        });
      });
    }

    Future<DocumentSnapshot> getTime(String path, int i) {
      Firebase.initializeApp();
      return FirebaseFirestore.instance.collection(path).get()
          // ignore: missing_return
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          card.add(TaskContainer(
            title: title[i],
            subtitle: id[i],
            day: doc["day"],
            start: doc["start"],
            end: doc["end"],
            boxColor: color[(i) % 4],
          ));
          // i++;
        });
      });
    }

    Future T() async {
      await getPath();
      // print(Path);
      for (int i = 0; i < Path.length; i++) {
        await getTime(Path[i], i);
      }
      // print(card);
    }

    return FutureBuilder(
        future: T(),
        builder: (context, snapshot) {
          List<Widget> C = [];
          // print(Day);
          List<String> time = [];
          for (int i = 0; i < card.length; i++) {
            if (card[i].day == Day) {
              List<String> t1 = card[i].start.split('.');
              List<String> t2 = card[i].end.split('.');
              double h1 = double.parse(t1[0]);
              double m1 = double.parse(t1[1]);
              double h2 = double.parse(t2[0]);
              double m2 = double.parse(t2[1]);
              double s = (h2 - h1) * 100;
              m1 = m1 / 60 * 100;
              m2 = m2 / 60 * 100;
              s = s - m1 + m2;
              print(s);
              if (!time.contains(card[i].start)) {
                C.add(TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.2,
                  hasIndicator: false,
                  startChild: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        card[i].start,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  endChild: _dashedText(),
                ));
                time.add(card[i].start);
              }
              C.add(TimelineTile(
                alignment: TimelineAlign.manual,
                hasIndicator: false,
                lineXY: 0.2,
                endChild: Container(
                  alignment: Alignment.centerLeft,
                  height: s,
                  width: 100,
                  color: card[i].boxColor,
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            card[i].title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: LightColors.kLightYellow,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Row(children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          card[i].subtitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: LightColors.kLightYellow,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ));
              if (!time.contains(card[i].end)) {
                C.add(TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.2,
                  hasIndicator: false,
                  startChild: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        card[i].end,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  endChild: _dashedText(),
                ));
                time.add(card[i].end);
              }
            }
          }
          if (time.isEmpty) {
            C.add(SizedBox(
              height: 150,
            ));
            C.add(
              Container(
                alignment: Alignment.center,
                child: Text(
                  "No Schedule TODAY",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            );
          }

          return Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: C),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
