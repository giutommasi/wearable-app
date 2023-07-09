import 'package:pregnancy_health/Constants/colors.dart';
import 'package:pregnancy_health/Pages/food_plan/widget/class.dart';
import 'package:pregnancy_health/Pages/food_plan/widget/food_list.dart';
import 'package:pregnancy_health/Pages/food_plan/widget/food_list_view.dart';
import 'package:flutter/material.dart';
import 'food_plan/appbar.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';

class DailyPlan1 extends StatefulWidget {
  final int count;
  const DailyPlan1({super.key, required this.count});

  @override
  State<StatefulWidget> createState() => _DailyPlan1State();
}

class _DailyPlan1State extends State<DailyPlan1> {
  var selected = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double PROGRESS = Week[widget.count].kcal / 2071 > 1
        ? Week[widget.count].kcal / 2071 - 1
        : Week[widget.count].kcal / 2071;
    final today = DateTime.now();
    final Size size = MediaQuery.of(context).size;
    final H = size.height;
    final W = size.width;

    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
          page: true,
          title: '',
          icon: Icons.arrow_back,
          actions: null,
          color: Colors.white),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: const Color.fromARGB(255, 240, 240, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: H * 0.39,
              width: W,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        gradientStart,
                        gradientEnd,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: gradientEnd,
                      offset: Offset(0, 1),
                      blurRadius: 4.0,
                      spreadRadius: 0.3,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(500, 95),
                      bottomRight: Radius.elliptical(500, 95))),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 18, top: 40, left: 32, right: 26),
                child: Column(
                  //Intestazione colorata
                  children: [
                    //Intestazione data, numero settimana
                    Padding(
                      padding: const EdgeInsets.only(right: 78.0),
                      //Intestazione data, numero settimana
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Data
                              Text(
                                '${DateFormat('EEEE').format(today)}, ${DateFormat('d MMMM yy').format(today)} ',
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                              //DailyRoutine
                              const Text(
                                'Daily Routine: ',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            Week[widget.count].day,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 47,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 45),
                    Row(
                      children: [
                        _RadialProgress(
                            height: H * 0.15,
                            width: W * 0.3,
                            progress: PROGRESS,
                            index: widget.count),
                        SizedBox(width: W * 0.08),
                        Macros(Width: W, index: widget.count)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
              child: FoodList(widget.count, selected, (index) {
                setState(() {
                  selected = index;
                });
                pageController.jumpToPage(index);
              }),
            ),
            Expanded(
              child: FoodListView(widget.count, selected, (int index) {
                setState(
                  () {
                    selected = index;
                  },
                );
              }, pageController),
            ),
          ],
        ),
      ),
    ));
  }
}

class Macros extends StatelessWidget {
  final int index;
  const Macros({
    super.key,
    required this.index,
    required this.Width,
  });

  final double Width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        _DietProgress(
          ingredient: 'Protein',
          leftAmount: (Week[index].prot / 139 * 100).toInt() > 100
              ? '+${((Week[index].prot / 139 * 100) - 100).toInt().toString()}'
              : '-${(100 - Week[index].prot / 139 * 100).toInt().toString()}',
          progress: Week[index].prot / 139,
          ProgressColor: Colors.blue,
          width: Width * 0.3,
        ),
        _DietProgress(
          ingredient: 'Carbs',
          leftAmount: (Week[index].carbs / 376 * 100).toInt() > 100
              ? '+${((Week[index].carbs / 376 * 100) - 100).toInt().toString()}'
              : '-${(100 - Week[index].carbs / 376 * 100).toInt().toString()}',
          progress: Week[index].carbs / 376,
          ProgressColor: Colors.yellow,
          width: Width * 0.3,
        ),
        _DietProgress(
          ingredient: 'Fat',
          leftAmount: (Week[index].fat / 67 * 100).toInt() > 100
              ? '+${((Week[index].fat / 67 * 100) - 100).toInt().toString()}'
              : '-${(100 - Week[index].fat / 67 * 100).toInt().toString()}',
          progress: Week[index].fat / 67,
          ProgressColor: Colors.red,
          width: Width * 0.3,
        ),
      ],
    );
  }
}

class _DietProgress extends StatelessWidget {
  final String ingredient, leftAmount;
  final double progress, width;
  final Color ProgressColor;

  const _DietProgress(
      {required this.ingredient,
      required this.leftAmount,
      required this.progress,
      required this.ProgressColor,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  height: 5,
                  width: width,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                Container(
                  height: 5,
                  width: width * progress,
                  decoration: BoxDecoration(
                      color: ProgressColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Text(
              '$leftAmount%',
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;
  final int index;

  const _RadialProgress(
      {required this.index,
      required this.height,
      required this.width,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: progress),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: '${Week[index].kcal.toString()}/ \n',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 24,
                    )),
                TextSpan(
                    text: progress > 1
                        ? '+${((progress - 1) * 100).toInt().toString()}%\n(Average Value)'
                        : '-${(100 - (progress * 100)).toInt().toString()}%\n(Average Value)',
                    //######################################################################
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 14,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 5
      ..color = const Color(0xFFFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
