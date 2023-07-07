import 'package:pregnancy_health/progress_trace/views/progress_trace_weekly_view.dart';
import 'package:pregnancy_health/repositories/calories_repository.dart';
import 'package:pregnancy_health/repositories/sleep_repository.dart';
import 'package:pregnancy_health/repositories/steps_repository.dart';
import 'package:pregnancy_health/services/impact_auth.dart';
import 'package:flutter/material.dart';
import '../Constants/pregnancy_health_app_theme.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'models/bottom_bar_icon_data.dart';
import 'views/progress_trace_view.dart';
import 'package:provider/provider.dart';

class ProgressTraceScreen extends StatefulWidget {
  const ProgressTraceScreen({super.key});

  @override
  ProgressTraceScreenState createState() => ProgressTraceScreenState();
}

class ProgressTraceScreenState extends State<ProgressTraceScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  bool impactUp = false;

  bool weeklyView = false;

  List<BottomBarIconData> tabIconsList = BottomBarIconData.tabIconsList;

  Widget tabBody = Container(
    color: PHAppTheme.background,
  );

  @override
  void initState() {
    super.initState();

    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = ProgressTraceUI(animationController: animationController);

    checkImpact();
  }

  void checkImpact() async {
    bool result = await ImpactAuth.isUp();

    if (!result) {
      const snackBar = SnackBar(
        content: Text('Impact services are down!'),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      }
    }
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
              print("Not Done");
              return const Center(
                  child: Center(
                child: CircularProgressIndicator(
                  color: PHAppTheme.pink,
                ),
              ));
            } else {
              print("Done");
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
    bool res = await getDailyData();

    if (res) res = await getWeeklyData();

    return res;
  }

  Future<bool> getWeeklyData() async {
    print(" CAlled get weekly");
    final stepsRepo = Provider.of<StepsRepository>(context, listen: false);
    final caloriesRepo =
        Provider.of<CaloriesRepository>(context, listen: false);
    final sleepRepo = Provider.of<SleepRepository>(context, listen: false);

    await ImpactAuth.getAndStoreTokens();

    print("STEPS ARE: ${stepsRepo.weeklySteps.length}");
    final steps = stepsRepo.loadAll();
    final calories = caloriesRepo.loadAll();
    final sleep = sleepRepo.loadAll();

    try {
      await Future.wait([steps, calories, sleep]);
      print("STEPS NOW ARE: ${stepsRepo.weeklySteps.length}");
    } catch (e) {
      print(e);
      if (context.mounted) {
        Navigator.pop(context, "Error while retrieving data from impact");
      }
    }

    return true;
  }

  Future<bool> getDailyData() async {
    final stepsRepo = Provider.of<StepsRepository>(context, listen: false);
    final caloriesRepo =
        Provider.of<CaloriesRepository>(context, listen: false);
    final sleepRepo = Provider.of<SleepRepository>(context, listen: false);

    await ImpactAuth.getAndStoreTokens();

    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day)
        .subtract(const Duration(days: 1));

    final steps = stepsRepo.selectDay(yesterday);
    final calories = caloriesRepo.selectDay(yesterday);
    final sleep = sleepRepo.selectDay(yesterday);

    try {
      await Future.wait([steps, calories, sleep]);
    } catch (e) {
      print(e);
      if (context.mounted) {
        Navigator.pop(context, "Error while retrieving data from impact");
      }
    }

    print("Data retrieved");

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
                  weeklyView = false;
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
                  weeklyView = true;
                  tabBody = ProgressTraceWeeklyUI(
                      animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
