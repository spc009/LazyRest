import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';
import 'package:flutter_task_planner_app/widgets/my_text_field.dart';
import 'package:flutter_task_planner_app/screens/home_page.dart';
import 'package:intl/intl.dart';

class CreateNewTaskPage extends StatelessWidget {
  DateTime _myDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      MyBackButton(),
                      Text(
                        'Create new Challenge',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyTextField(label: 'Title'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              // icon: downwardIcon,
                              value: DateFormat('yyyy-MM-dd')
                                  .format(_myDateTime)
                                  .toString(),
                              // value: _myDateTime.toString(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              _myDateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year - 5),
                                lastDate: DateTime(DateTime.now().year + 5),
                              );
                            },
                            child: HomePage.calendarIcon(),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  MyTextField(
                    label: 'Description',
                    minLines: 3,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //direction: Axis.vertical,
                          alignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          runSpacing: 0,
                          //textDirection: TextDirection.rtl,
                          spacing: 10.0,
                          children: <Widget>[
                            Chip(
                              label: Text("SPORT APP"),
                              backgroundColor: LightColors.kRed,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            Chip(
                              label: Text("MEDICAL APP"),
                            ),
                            Chip(
                              label: Text("RENT APP"),
                            ),
                            Chip(
                              label: Text("NOTES"),
                            ),
                            Chip(
                              label: Text("GAMING PLATFORM APP"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Create Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 40,
                    decoration: BoxDecoration(
                      color: LightColors.kBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //
                  //   },
                  // ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () async {
            //     FirebaseFirestore.instance
            //         .collection('Challenge/Yz2z72IvKzYvRMdg6ZC9/name')
            //         .snapshots()
            //         .listen((event) {
            //       print('got that');
            //     });
            //   },
            //   child: HomePage.calendarIcon(),
            // ), 
          ],
        ),
      ),
    );
  }
}
