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

class Get_courses extends StatelessWidget {
  List<ActiveProjectsCard> card = [];
  var lock = Lock();
  List<Color> color = [
    LightColors.kGreen,
    LightColors.kRed,
    LightColors.kYellow,
    LightColors.kDarkRed,
  ];

  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot> getCourse() {
      Firebase.initializeApp();
      return FirebaseFirestore.instance.collection('Courses').get()
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

    return FutureBuilder(
        future: getCourse(),
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
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskPage(
                                cardColor: card[i].cardColor,
                                loadingPercent: card[i].loadingPercent,
                                title: card[i].title,
                                id: card[i].id),
                          ),
                        );
                      },
                      child: card[i],
                    ),
                  ),
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: C,
          );
        });
  }
}
