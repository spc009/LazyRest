import 'package:flutter_task_planner_app/widgets/Date.dart';

List<String> days = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
// List<String> dates = [
//   DateTime.now().day.toString(),
//   DateTime.now().add(Duration(days: 1)).day.toString(),
//   DateTime.now().add(Duration(days: 2)).day.toString(),
//   DateTime.now().add(Duration(days: 3)).day.toString(),
//   DateTime.now().add(Duration(days: 4)).day.toString(),
//   DateTime.now().add(Duration(days: 5)).day.toString(),
//   DateTime.now().add(Duration(days: 6)).day.toString(),
// ];

List<DateTime> d = [
  DateTime.now(),
  DateTime.now().add(Duration(days: 1)),
  DateTime.now().add(Duration(days: 2)),
  DateTime.now().add(Duration(days: 3)),
  DateTime.now().add(Duration(days: 4)),
  DateTime.now().add(Duration(days: 5)),
  DateTime.now().add(Duration(days: 6)),
  DateTime.now().add(Duration(days: 7)),
  DateTime.now().add(Duration(days: 8)),
  DateTime.now().add(Duration(days: 9)),
  DateTime.now().add(Duration(days: 10)),
  DateTime.now().add(Duration(days: 11)),
  DateTime.now().add(Duration(days: 12)),
  DateTime.now().add(Duration(days: 13)),
  DateTime.now().add(Duration(days: 14)),
];

List<String> time = [
  '8.00',
  '8.30',
  '9.00',
  '9.30',
  '10.00',
  '10.30',
  '11.00',
  '11.30',
  '12.00',
  '12.30',
  '1.00',
  '1.30',
  '2.00',
  '2.30',
  '3.00',
  '3.30',
  '4.00',
  '4.30',
  '5.00',
  '5.30',
  '6.00',
  '6.30',
  '7.00'
];

DateTime firstDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
