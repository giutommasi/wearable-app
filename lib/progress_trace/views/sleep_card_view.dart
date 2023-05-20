import 'package:exam/Constants/pregnancy_health_app_theme.dart';
import 'package:flutter/material.dart';
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
                  color: PHAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: PHAppTheme.grey.withOpacity(0.2),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, bottom: 3),
                                    child: Text(
                                      '7H',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: PHAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        color: HexColor("#00A0FF"),
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
                                          'You fall asleep at 23:00',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: PHAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                            color: HexColor('#00A0FF'),
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
                                        const Text(
                                          'Woke Up at 08:00',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: PHAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                            color: PHAppTheme.pink,
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
                                                    color: PHAppTheme
                                                        .nearlyDarkBlue
                                                        .withOpacity(0.2)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '${(95 * animation!.value).toInt()}',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          PHAppTheme.fontName,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 24,
                                                      letterSpacing: 0.0,
                                                      color: PHAppTheme
                                                          .nearlyDarkBlue,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Efficiency',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          PHAppTheme.fontName,
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
                                            padding: const EdgeInsets.all(4.0),
                                            child: CustomPaint(
                                              painter: CurvePainter(
                                                  colors: [
                                                    HexColor("#00A0FF"),
                                                    HexColor("#00A0FF"),
                                                    HexColor("#00B6F0")
                                                  ],
                                                  // Max 345
                                                  angle: 300 +
                                                      (360 - 300) *
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
                          color: PHAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          HexColor('#00B6F0').withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width:
                                              ((70 / 1.2) * animation!.value),
                                          height: 4,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              HexColor('#00B6F0'),
                                              HexColor('#00B6F0')
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
                                    '8H Sleep',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: PHAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: PHAppTheme.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      '90%',
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
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Asleep',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: PHAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              PHAppTheme.grey.withOpacity(0.5),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    const Text(
                                      '10%',
                                      style: TextStyle(
                                        fontFamily: PHAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: PHAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Awake',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: PHAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              PHAppTheme.grey.withOpacity(0.5),
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
                      ),
                    )
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
