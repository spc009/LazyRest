import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseDetail extends StatelessWidget {
  final Color cardColor;
  final double loadingPercent;
  final String title;
  final String id;

  CourseDetail({
    this.cardColor,
    this.loadingPercent,
    this.title,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(15.0),
        height: 200,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      animation: true,
                      radius: 40.0,
                      percent: loadingPercent,
                      lineWidth: 5.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey,
                      progressColor: LightColors.kBlue,
                      center: Text(
                        '${(loadingPercent * 100).round()}%',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: LightColors.kBlue),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),  
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: LightColors.kBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: LightColors.kBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
