import 'package:exam/Constants/pregnancy_health_app_theme.dart';
import 'package:exam/main.dart';
import 'package:exam/repositories/calories_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/curve_painter.dart';

class CaloriesCardView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const CaloriesCardView({Key? key, this.animationController, this.animation})
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
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color:
                            Color.fromARGB(255, 244, 143, 177).withOpacity(0.7),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    // This is the first row that contains eaten, burned and
                    // left calories
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Consumer<CaloriesRepository>(
                          builder: (context, repo, child) {
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 4),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 48,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: HexColor('#60cef0')
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 4, bottom: 2),
                                                    child: Text(
                                                      'Eaten',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            PHAppTheme.fontName,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: PHAppTheme.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 28,
                                                        height: 28,
                                                        child: Image.asset(
                                                            "assets/images/progress_trace/eaten.png"),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4,
                                                                bottom: 3),
                                                        child: Text(
                                                          '${(getEaten() * animation!.value).toInt()}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                PHAppTheme
                                                                    .fontName,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16,
                                                            color: PHAppTheme
                                                                .darkerText,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4,
                                                                bottom: 3),
                                                        child: Text(
                                                          'Kcal',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                PHAppTheme
                                                                    .fontName,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                            letterSpacing: -0.2,
                                                            color: PHAppTheme
                                                                .grey
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 48,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F56E98')
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 4, bottom: 2),
                                                    child: Text(
                                                      'Burned',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            PHAppTheme.fontName,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: PHAppTheme.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 28,
                                                        height: 28,
                                                        child: Image.asset(
                                                            "assets/images/progress_trace/burned.png"),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 4,
                                                                bottom: 3),
                                                        child: Text(
                                                          '${(getBurned(repo) * animation!.value).toInt()}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                PHAppTheme
                                                                    .fontName,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16,
                                                            color: PHAppTheme
                                                                .darkerText,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                bottom: 3),
                                                        child: Text(
                                                          'Kcal',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                PHAppTheme
                                                                    .fontName,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                            letterSpacing: -0.2,
                                                            color: PHAppTheme
                                                                .grey
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Center(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: PHAppTheme.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(100.0),
                                              ),
                                              border: Border.all(
                                                  width: 4,
                                                  color: Color.fromARGB(
                                                          255, 11, 70, 166)
                                                      .withOpacity(0.2)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${((1600 - getEaten()) * animation!.value).toInt()}',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        PHAppTheme.fontName,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 26,
                                                    letterSpacing: 0.0,
                                                    color: Color.fromRGBO(
                                                        13, 71, 161, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Kcal left',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        PHAppTheme.fontName,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    letterSpacing: 0.0,
                                                    color: PHAppTheme.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: CustomPaint(
                                            painter: CurvePainter(
                                                colors: [
                                                  Color(0xFF80DEEA),
                                                  HexColor("#8A98E8"),
                                                  HexColor("#8A98E8")
                                                ],
                                                angle: getAngle(1600) +
                                                    (360 - getAngle(1600)) *
                                                        (1.0 -
                                                            animation!.value)),
                                            child: const SizedBox(
                                              width: 108,
                                              height: 108,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          color: PHAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    // This is the third row that contains goal for calories
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 8, bottom: 16),
                        child: Consumer<CaloriesRepository>(
                          builder: (context, repo, child) {
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Goal',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: PHAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.2,
                                          color: PHAppTheme.darkText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Container(
                                          height: 4,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: HexColor('#87A0E5')
                                                .withOpacity(0.2),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4.0)),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width:
                                                    (getGoalStatus(repo, 1600) *
                                                        animation!.value),
                                                height: 4,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      LinearGradient(colors: [
                                                    HexColor('#87A0E5'),
                                                    HexColor('#87A0E5')
                                                        .withOpacity(0.5),
                                                  ]),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(4.0)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Text(
                                          '1600 Kcal',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: PHAppTheme.fontName,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: PHAppTheme.grey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //   Expanded(
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       crossAxisAlignment: CrossAxisAlignment.center,
                                //       children: <Widget>[
                                //         Column(
                                //           mainAxisAlignment: MainAxisAlignment.center,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: <Widget>[
                                //             const Text(
                                //               'Protein',
                                //               textAlign: TextAlign.center,
                                //               style: TextStyle(
                                //                 fontFamily: PHAppTheme.fontName,
                                //                 fontWeight: FontWeight.w500,
                                //                 fontSize: 16,
                                //                 letterSpacing: -0.2,
                                //                 color: PHAppTheme.darkText,
                                //               ),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(top: 4),
                                //               child: Container(
                                //                 height: 4,
                                //                 width: 70,
                                //                 decoration: BoxDecoration(
                                //                   color: HexColor('#F56E98')
                                //                       .withOpacity(0.2),
                                //                   borderRadius: const BorderRadius.all(
                                //                       Radius.circular(4.0)),
                                //                 ),
                                //                 child: Row(
                                //                   children: <Widget>[
                                //                     Container(
                                //                       width: ((70 / 2) *
                                //                           animationController!.value),
                                //                       height: 4,
                                //                       decoration: BoxDecoration(
                                //                         gradient:
                                //                             LinearGradient(colors: [
                                //                           HexColor('#F56E98')
                                //                               .withOpacity(0.1),
                                //                           HexColor('#F56E98'),
                                //                         ]),
                                //                         borderRadius:
                                //                             const BorderRadius.all(
                                //                                 Radius.circular(4.0)),
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(top: 6),
                                //               child: Text(
                                //                 '30g left',
                                //                 textAlign: TextAlign.center,
                                //                 style: TextStyle(
                                //                   fontFamily: PHAppTheme.fontName,
                                //                   fontWeight: FontWeight.w600,
                                //                   fontSize: 12,
                                //                   color:
                                //                       PHAppTheme.grey.withOpacity(0.5),
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                //   Expanded(
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       crossAxisAlignment: CrossAxisAlignment.center,
                                //       children: <Widget>[
                                //         Column(
                                //           mainAxisAlignment: MainAxisAlignment.center,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: <Widget>[
                                //             const Text(
                                //               'Fat',
                                //               style: TextStyle(
                                //                 fontFamily: PHAppTheme.fontName,
                                //                 fontWeight: FontWeight.w500,
                                //                 fontSize: 16,
                                //                 letterSpacing: -0.2,
                                //                 color: PHAppTheme.darkText,
                                //               ),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(
                                //                   right: 0, top: 4),
                                //               child: Container(
                                //                 height: 4,
                                //                 width: 70,
                                //                 decoration: BoxDecoration(
                                //                   color: HexColor('#F1B440')
                                //                       .withOpacity(0.2),
                                //                   borderRadius: const BorderRadius.all(
                                //                       Radius.circular(4.0)),
                                //                 ),
                                //                 child: Row(
                                //                   children: <Widget>[
                                //                     Container(
                                //                       width: ((70 / 2.5) *
                                //                           animationController!.value),
                                //                       height: 4,
                                //                       decoration: BoxDecoration(
                                //                         gradient:
                                //                             LinearGradient(colors: [
                                //                           HexColor('#F1B440')
                                //                               .withOpacity(0.1),
                                //                           HexColor('#F1B440'),
                                //                         ]),
                                //                         borderRadius:
                                //                             const BorderRadius.all(
                                //                                 Radius.circular(4.0)),
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(top: 6),
                                //               child: Text(
                                //                 '10g left',
                                //                 textAlign: TextAlign.center,
                                //                 style: TextStyle(
                                //                   fontFamily: PHAppTheme.fontName,
                                //                   fontWeight: FontWeight.w600,
                                //                   fontSize: 12,
                                //                   color:
                                //                       PHAppTheme.grey.withOpacity(0.5),
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //   )
                              ],
                            );
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

int getGoalStatus(CaloriesRepository repo, int max) {
  final cal = repo.dailyCalories;
  if (cal != null) {
    if (cal.eaten.floor() >= max) return 100;

    if (cal.eaten >= 0) {
      return (cal.eaten.floor() * 100 / max).floor();
    }
  }

  return 0;
}

int getEaten() {
  return 1200;
}

int getBurned(CaloriesRepository repo) {
  final cal = repo.dailyCalories;
  if (cal != null) {
    return cal.burned.floor();
  }

  return 0;
}

double getAngle(int max) {
  final remainedCalories = max - getEaten();
  if (remainedCalories == 0) return 0;
  if (remainedCalories >= max) return 360;
  return 360 * remainedCalories / max;
}
