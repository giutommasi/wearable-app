import 'package:exam/Constants/pregnancy_health_app_theme.dart';
import 'package:exam/repositories/calories_repository.dart';
import 'package:exam/repositories/sleep_repository.dart';
import 'package:exam/repositories/steps_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProgressAppBar extends StatefulWidget {
  const ProgressAppBar(
      {Key? key,
      required this.animationController,
      required this.scrollController,
      required this.weekly})
      : super(key: key);

  final AnimationController? animationController;
  final ScrollController? scrollController;
  final bool weekly;

  @override
  ProgressAppBarState createState() => ProgressAppBarState();
}

class ProgressAppBarState extends State<ProgressAppBar> {
  Animation<double>? topBarAnimation;

  double topBarOpacity = 0.0;
  String selectedDate = getYesterdayDate();
  bool nextDayEnabled = false;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    ScrollController scrollController = widget.scrollController!;

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: PHAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              PHAppTheme.grey.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16 - 8.0 * topBarOpacity,
                              bottom: 12 - 8.0 * topBarOpacity),
                          child: getAppBarRow())
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget getAppBarRow() {
    if (widget.weekly) return getWeeklyAppbar();

    return getAppbarDaily();
  }

  Widget getWeeklyAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 38,
          width: 38,
          child: InkWell(
            highlightColor: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Icon(
                Icons.arrow_back,
                color: PHAppTheme.grey,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Progress',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: PHAppTheme.fontName,
                fontWeight: FontWeight.w700,
                fontSize: 22 + 6 - 6 * topBarOpacity,
                letterSpacing: 1.2,
                color: PHAppTheme.darkerText,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getAppbarDaily() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 38,
          width: 38,
          child: InkWell(
            highlightColor: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Icon(
                Icons.arrow_back,
                color: PHAppTheme.grey,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Progress',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: PHAppTheme.fontName,
                fontWeight: FontWeight.w700,
                fontSize: 22 + 6 - 6 * topBarOpacity,
                letterSpacing: 1.2,
                color: PHAppTheme.darkerText,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 38,
          width: 38,
          child: InkWell(
            highlightColor: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            onTap: () {
              setState(() {
                selectedDate = getPreviousDay(selectedDate);
                nextDayEnabled = true;

                DateTime d = DateFormat('dd MMM yy').parse(selectedDate);

                Provider.of<CaloriesRepository>(context, listen: false)
                    .updateDailyCalories(d);

                Provider.of<StepsRepository>(context, listen: false)
                    .updateDailySteps(d);
                Provider.of<SleepRepository>(context, listen: false)
                    .updateDailySleep(d);
              });
            },
            child: const Center(
              child: Icon(
                Icons.keyboard_arrow_left,
                color: PHAppTheme.grey,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.calendar_today,
                  color: PHAppTheme.grey,
                  size: 18,
                ),
              ),
              Text(
                selectedDate,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: PHAppTheme.fontName,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  letterSpacing: -0.2,
                  color: PHAppTheme.darkerText,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 38,
          width: 38,
          child: InkWell(
            highlightColor: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            onTap: () {
              setState(() {
                final nextSelection = getNextDay(selectedDate);

                DateTime d = DateFormat('dd MMM yy').parse(nextSelection);

                final now = DateTime.now();
                nextDayEnabled =
                    !d.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
                if (!nextDayEnabled) return;

                selectedDate = nextSelection;

                Provider.of<CaloriesRepository>(context, listen: false)
                    .updateDailyCalories(d);
                Provider.of<StepsRepository>(context, listen: false)
                    .updateDailySteps(d);
                Provider.of<SleepRepository>(context, listen: false)
                    .updateDailySleep(d);
              });
            },
            child: const Center(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: PHAppTheme.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String getYesterdayDate() {
  DateTime now = DateTime.now();
  DateTime yesterday =
      DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));
  return DateFormat('dd MMM yy').format(yesterday);
}

String getPreviousDay(String day) {
  DateTime temp = DateFormat('dd MMM yy').parse(day);
  temp = temp.subtract(const Duration(days: 1));

  return DateFormat('dd MMM yy').format(temp);
}

String getNextDay(String day) {
  DateTime temp = DateFormat('dd MMM yy').parse(day);
  temp = temp.add(const Duration(days: 1));

  return DateFormat('dd MMM yy').format(temp);
}
