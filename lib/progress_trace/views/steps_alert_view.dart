import 'package:exam/main.dart';
import 'package:flutter/material.dart';

import '../../Constants/pregnancy_health_app_theme.dart';

class StepsAlertView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const StepsAlertView({Key? key, this.animationController, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 24),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("#a82aa4"),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            // boxShadow: <BoxShadow>[
                            //   BoxShadow(
                            //       color: FitnessAppTheme.grey.withOpacity(0.2),
                            //       offset: Offset(1.1, 1.1),
                            //       blurRadius: 10.0),
                            // ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 68, bottom: 12, right: 16, top: 12),
                                child: Text(
                                  'In the last 24 hours, you walked 7000 steps and exceeded of 300 Kcal. Keep an eye.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: PHAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: HexColor("#211f20").withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -12,
                        left: 0,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                              "assets/images/progress_trace/runner.png"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
