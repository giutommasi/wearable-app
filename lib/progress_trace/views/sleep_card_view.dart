import 'package:exam/Constants/pregnancy_health_app_theme.dart';
import 'package:exam/repositories/sleep_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../database/entities/sleep.dart';
import '../../main.dart';
import '../widgets/curve_painter.dart';

class SleepCardView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const SleepCardView({Key? key, this.animationController, this.animation})
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
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: const Color.fromRGBO(13, 71, 161, 1)
                            .withOpacity(0.6),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 4, bottom: 8, top: 8),
                          ),
                          Consumer<SleepRepository>(
                            builder: (context, repo, child) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 3),
                                        child: Text(
                                          '${getSleep(repo).duration ~/ 3600}H${((getSleep(repo).duration / 60) % 60).toInt()}M',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: PHAppTheme.fontName,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 32,
                                            color: Color(0xFF80DEEA),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Image.asset(
                                                  'assets/images/progress_trace/zzz.png'),
                                            ),
                                            Text(
                                              'You fall asleep at ${getFallASleep(getSleep(repo))}',
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontFamily: PHAppTheme.fontName,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                color: Color.fromARGB(
                                                    255, 244, 143, 177),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Image.asset(
                                                  'assets/images/progress_trace/bell.png'),
                                            ),
                                            Text(
                                              'Woke Up at ${getWokeUp(getSleep(repo))}',
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontFamily: PHAppTheme.fontName,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                color: Color(0xFF80DEEA),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Center(
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(100.0),
                                                    ),
                                                    border: Border.all(
                                                        width: 4,
                                                        color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                143,
                                                                31,
                                                                143)
                                                            .withOpacity(0.2)),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        '${(getSleep(repo).efficiency.toInt() * animation!.value).toInt()}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          fontFamily: PHAppTheme
                                                              .fontName,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 27,
                                                          letterSpacing: 0.0,
                                                          color: Color.fromARGB(
                                                              255, 159, 14, 91),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Efficiency',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily: PHAppTheme
                                                              .fontName,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: CustomPaint(
                                                  painter: CurvePainter(
                                                      colors: [
                                                        HexColor("#f48fb1"),
                                                        HexColor("#f48fb1"),
                                                        HexColor("#f48fb1")
                                                      ],
                                                      // Max 345
                                                      angle: getAngle(
                                                              getSleep(repo)) +
                                                          (360 -
                                                                  getAngle(
                                                                      getSleep(
                                                                          repo))) *
                                                              (1.0 -
                                                                  animation!
                                                                      .value)),
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
                                  )
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 8, bottom: 16),
                        child: Consumer<SleepRepository>(
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
                                            color: HexColor('#00B6F0')
                                                .withOpacity(0.2),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4.0)),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: (getGoalStatus(
                                                        getSleep(repo),
                                                        getGoalHour()) *
                                                    animation!.value),
                                                height: 4,
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 244, 143, 177),
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                          '${getGoalHour()}H Sleep',
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

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${getAsleepPercentage(getSleep(repo))}%',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: PHAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.2,
                                              color: PHAppTheme.darkText,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Text(
                                              'Asleep',
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
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '${getAwakePercentage(getSleep(repo))}%',
                                            style: const TextStyle(
                                              fontFamily: PHAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.2,
                                              color: PHAppTheme.darkText,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Text(
                                              'Awake',
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
                                    ],
                                  ),
                                )

                                // Expanded(
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: <Widget>[
                                //       const Text(
                                //         '185 cm',
                                //         textAlign: TextAlign.center,
                                //         style: TextStyle(
                                //           fontFamily: PHAppTheme.fontName,
                                //           fontWeight: FontWeight.w500,
                                //           fontSize: 16,
                                //           letterSpacing: -0.2,
                                //           color: PHAppTheme.darkText,
                                //         ),
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.only(top: 6),
                                //         child: Text(
                                //           'Height',
                                //           textAlign: TextAlign.center,
                                //           style: TextStyle(
                                //             fontFamily: PHAppTheme.fontName,
                                //             fontWeight: FontWeight.w600,
                                //             fontSize: 12,
                                //             color: PHAppTheme.grey.withOpacity(0.5),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Expanded(
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                //     children: <Widget>[
                                //       Column(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: <Widget>[
                                //           const Text(
                                //             '27.3 BMI',
                                //             textAlign: TextAlign.center,
                                //             style: TextStyle(
                                //               fontFamily: PHAppTheme.fontName,
                                //               fontWeight: FontWeight.w500,
                                //               fontSize: 16,
                                //               letterSpacing: -0.2,
                                //               color: PHAppTheme.darkText,
                                //             ),
                                //           ),
                                //           Padding(
                                //             padding: const EdgeInsets.only(top: 6),
                                //             child: Text(
                                //               'Overweight',
                                //               textAlign: TextAlign.center,
                                //               style: TextStyle(
                                //                 fontFamily: PHAppTheme.fontName,
                                //                 fontWeight: FontWeight.w600,
                                //                 fontSize: 12,
                                //                 color:
                                //                     PHAppTheme.grey.withOpacity(0.5),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Expanded(
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.end,
                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                //     children: <Widget>[
                                //       Column(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.end,
                                //         children: <Widget>[
                                //           const Text(
                                //             '20%',
                                //             style: TextStyle(
                                //               fontFamily: PHAppTheme.fontName,
                                //               fontWeight: FontWeight.w500,
                                //               fontSize: 16,
                                //               letterSpacing: -0.2,
                                //               color: PHAppTheme.darkText,
                                //             ),
                                //           ),
                                //           Padding(
                                //             padding: const EdgeInsets.only(top: 6),
                                //             child: Text(
                                //               'Body fat',
                                //               textAlign: TextAlign.center,
                                //               style: TextStyle(
                                //                 fontFamily: PHAppTheme.fontName,
                                //                 fontWeight: FontWeight.w600,
                                //                 fontSize: 12,
                                //                 color:
                                //                     PHAppTheme.grey.withOpacity(0.5),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // )
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

Sleep getSleep(SleepRepository repo) {
  Sleep? sleep = repo.dailySleep;
  if (sleep != null) {
    return sleep;
  }

  DateTime now = DateTime.now();
  return Sleep(
      startTime: now,
      endTime: now,
      minutesAsleep: 0,
      minutesAwake: 0,
      efficiency: 0,
      date: now,
      duration: 0);
}

int getGoalStatus(Sleep sleep, int max) {
  // max is hour
  final maxMinutes = max * 60;
  final duration = sleep.duration / 60;

  if (duration >= maxMinutes) return 100;

  if (duration >= 0) {
    return duration * 100 ~/ maxMinutes;
  }

  return 0;
}

String getFallASleep(Sleep sleep) {
  return DateFormat("HH:mm").format(sleep.startTime).toString();
}

String getWokeUp(Sleep sleep) {
  return DateFormat("HH:mm").format(sleep.endTime).toString();
}

String getAsleepPercentage(Sleep sleep) {
  if (sleep.duration == 0) return "0";
  int duration = sleep.duration ~/ 60;

  int minutesAsleep = sleep.minutesAsleep;

  return (minutesAsleep * 100 ~/ duration).toString();
}

String getAwakePercentage(Sleep sleep) {
  if (sleep.duration == 0) return "0";

  int duration = sleep.duration ~/ 60;

  int minutesAwake = sleep.minutesAwake;

  return (minutesAwake * 100 ~/ duration).toString();
}

double getAngle(Sleep sleep) {
  int efficiency = sleep.efficiency;
  if (efficiency == 0) return 0;
  if (efficiency >= 100) return 347;
  return efficiency * 347 / 100;
}

int getGoalHour() {
  return Sleep.maxGoal;
}
