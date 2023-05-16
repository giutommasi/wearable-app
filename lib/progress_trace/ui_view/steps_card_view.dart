import 'package:exam/Constants/pregnancy_health_app_theme.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class StepsCardView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const StepsCardView({Key? key, this.animationController, this.animation})
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
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4, bottom: 3),
                                    child: Text(
                                      '5000',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: PHAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        color: PHAppTheme.red,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding:
                                  //       EdgeInsets.only(left: 8, bottom: 8),
                                  //   child: Text(
                                  //     'Ibs',
                                  //     textAlign: TextAlign.center,
                                  //     style: TextStyle(
                                  //       fontFamily: PHAppTheme.fontName,
                                  //       fontWeight: FontWeight.w500,
                                  //       fontSize: 18,
                                  //       letterSpacing: -0.2,
                                  //       color: PHAppTheme.nearlyDarkBlue,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color: PHAppTheme.grey.withOpacity(0.5),
                                        size: 16,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          'Today 8:26 AM',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: PHAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: PHAppTheme.grey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 4, bottom: 14),
                                    child: Text(
                                      'Last measurement',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: PHAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: PHAppTheme.red,
                                      ),
                                    ),
                                  ),
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
                                          HexColor('#87A0E5').withOpacity(0.2),
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
                                              HexColor('#E53535'),
                                              HexColor('#E53535')
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
                                    '6000 Steps',
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
