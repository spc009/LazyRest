import 'package:flutter_task_planner_app/months_list.dart';

// DateTime date = DateTime.now();
String get_date(DateTime date) {
  return date.year.toString() +
      ' ' +
      date.month.toString() +
      ' ' +
      date.day.toString();
}

String get_year(date) {
  return date.year.toString();
}

String get_month_name(date) {
  int m = date.month;
  return month[m];
}

