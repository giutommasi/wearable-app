import 'package:flutter/material.dart';

class DailyPlanItem {
  String dayNumb, dayString;
  final Color color;
  bool training, favorite;
  bool starred;
  Widget pageRoute;
  DailyPlanItem({
    required this.dayNumb,
    required this.dayString,
    required this.color,
    required this.training,
    required this.favorite,
    required this.starred,
    required this.pageRoute,
  });
}

List<DailyPlanItem> products = [
  DailyPlanItem(
    dayNumb: '1',
    dayString: 'Monday',
    color: Colors.pink.shade100,
    training: true,
    favorite: false,
    starred: false,
    pageRoute: _1Page(),
  ),
  DailyPlanItem(
    dayNumb: '2',
    dayString: 'Tuesday',
    color: Colors.blue.shade100,
    training: true,
    favorite: false,
    starred: false,
    pageRoute: _2Page(),
  ),
  DailyPlanItem(
    dayNumb: '3',
    dayString: 'Wednasday',
    color: Colors.pink.shade200,
    training: false,
    favorite: false,
    starred: false,
    pageRoute: _3Page(),
  ),
  DailyPlanItem(
    dayNumb: '4',
    dayString: 'Thursday',
    color: Colors.blue.shade200,
    training: false,
    favorite: false,
    starred: false,
    pageRoute: _4Page(),
  ),
  DailyPlanItem(
    dayNumb: '5',
    dayString: 'Friday',
    color: Colors.pink.shade300,
    training: true,
    favorite: false,
    starred: false,
    pageRoute: _5Page(),
  ),
  DailyPlanItem(
    dayNumb: '6',
    dayString: 'Saturday',
    color: Colors.blue.shade300,
    training: false,
    favorite: false,
    starred: false,
    pageRoute: _6Page(),
  ),
  DailyPlanItem(
    dayNumb: '7',
    dayString: 'Sunday',
    color: Colors.pink.shade400,
    training: false,
    favorite: false,
    starred: false,
    pageRoute: _7Page(),
  ),
  // DailyPlanItem(
  //   dayNumb: '8',
  //   dayString: 'Starred Plans',
  //   color: Colors.orange.shade300,
  //   training: false,
  //   favorite: true,
  //   starred: true,
  //   pageRoute: _8Page(),
  // ),
];

Widget _1Page(){
  return Container();
}

Widget _2Page(){
  return Container();
}

Widget _3Page(){
  return Container();
}

Widget _4Page(){
  return Container();
}

Widget _5Page(){
  return Container();
}

Widget _6Page(){
  return Container();
}

Widget _7Page(){
  return Container();
}

// Widget _8Page(){
//   return Container();
// }
