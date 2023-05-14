import 'package:exam/Constants/pregnancy_health_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressAppBar extends StatefulWidget {
  const ProgressAppBar(
      {Key? key,
      required this.animationController,
      required this.scrollController})
      : super(key: key);

  final AnimationController? animationController;
  final ScrollController? scrollController;

  @override
  ProgressAppBarState createState() => ProgressAppBarState();
}

class ProgressAppBarState extends State<ProgressAppBar> {
  Animation<double>? topBarAnimation;

  double topBarOpacity = 0.0;

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
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
                                  'My Progress',
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
                                width: 300,
                                child:
                                    CupertinoSlidingSegmentedControl<TimeRange>(
                                  groupValue: TimeRange.lastYear,
                                  onValueChanged: (index) {
                                    print("Value Changed");
                                  },
                                  children: const {
                                    TimeRange.last30Days: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Today"),
                                    ),
                                    TimeRange.lastYear: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Last 7 Days"),
                                    ),
                                    TimeRange.allTime: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("All Time"),
                                    )
                                  },
                                )),
                          ],
                        ),
                      )
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
}

enum TimeRange {
  last30Days,
  lastYear,
  allTime;

  Duration? duration() {
    switch (this) {
      case TimeRange.last30Days:
        return const Duration(days: 30);
      case TimeRange.lastYear:
        return const Duration(days: 365);
      case TimeRange.allTime:
        return null;
    }
  }
}
