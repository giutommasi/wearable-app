import 'package:flutter/material.dart';
import '../Constants/pregnancy_health_app_theme.dart';
import 'views/progress_trace_view.dart';

class ProgressTraceScreen extends StatefulWidget {
  const ProgressTraceScreen({super.key});

  @override
  ProgressTraceScreenState createState() => ProgressTraceScreenState();
}

class ProgressTraceScreenState extends State<ProgressTraceScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  Widget tabBody = Container(
    color: PHAppTheme.background,
  );

  @override
  void initState() {
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
                  // bottomBar(),
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

  // Widget bottomBar() {
  //   return Column(
  //     children: <Widget>[
  //       const Expanded(
  //         child: SizedBox(),
  //       ),
  //       BottomBarView(
  //         tabIconsList: tabIconsList,
  //         addClick: () {},
  //         changeIndex: (int index) {
  //           if (index == 0 || index == 2) {
  //             animationController?.reverse().then<dynamic>((data) {
  //               if (!mounted) {
  //                 return;
  //               }
  //               setState(() {
  //                 tabBody =
  //                     MyDiaryScreen(animationController: animationController);
  //               });
  //             });
  //           } else if (index == 1 || index == 3) {
  //             animationController?.reverse().then<dynamic>((data) {
  //               if (!mounted) {
  //                 return;
  //               }
  //               setState(() {
  //                 tabBody =
  //                     TrainingScreen(animationController: animationController);
  //               });
  //             });
  //           }
  //         },
  //       ),
  //     ],
  //   );
  // }
}
