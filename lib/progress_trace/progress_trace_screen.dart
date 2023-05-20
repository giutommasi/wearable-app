import 'package:flutter/material.dart';
import '../Constants/pregnancy_health_app_theme.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'models/bottom_bar_icon_data.dart';
import 'views/progress_trace_view.dart';

class ProgressTraceScreen extends StatefulWidget {
  const ProgressTraceScreen({super.key});

  @override
  ProgressTraceScreenState createState() => ProgressTraceScreenState();
}

class ProgressTraceScreenState extends State<ProgressTraceScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<BottomBarIconData> tabIconsList = BottomBarIconData.tabIconsList;

  Widget tabBody = Container(
    color: PHAppTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = ProgressTraceUI(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PHAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: Center(
                child: CircularProgressIndicator(
                  color: PHAppTheme.pink,
                ),
              ));
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      ProgressTraceUI(animationController: animationController);
                });
              });
            } else if (index == 1 || index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      ProgressTraceUI(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
