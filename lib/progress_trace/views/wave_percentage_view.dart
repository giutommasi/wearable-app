import 'package:exam/Constants/pregnancy_health_app_theme.dart';
import 'package:exam/database/entities/sleep.dart';
import 'package:exam/database/entities/steps.dart';
import 'package:exam/progress_trace/views/wave_view.dart';
import 'package:exam/repositories/calories_repository.dart';
import 'package:exam/repositories/sleep_repository.dart';
import 'package:exam/repositories/steps_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WavePercentageView extends StatefulWidget {
  const WavePercentageView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _WavePercentageViewState createState() => _WavePercentageViewState();
}

class _WavePercentageViewState extends State<WavePercentageView>
    with TickerProviderStateMixin {
  late int percentage;

  @override
  void initState() {
    super.initState();
    percentage = calculatePercentage();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 8, top: 16),
                              child: Container(
                                width: 120,
                                height: 400,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(80.0),
                                      bottomLeft: Radius.circular(80.0),
                                      bottomRight: Radius.circular(80.0),
                                      topRight: Radius.circular(80.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 255, 255, 255)
                                            .withOpacity(0.6),
                                        offset: const Offset(2, 2),
                                        blurRadius: 4),
                                  ],
                                ),
                                child: WaveView(
                                  percentageValue: percentage,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "You reached $percentage% of your goal \nin the last 7 days!",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: PHAppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  color: Color.fromARGB(255, 244, 115, 158),
                                ))
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        );
      },
    );
  }

  int calculatePercentage() {
    final stepsRepo = Provider.of<StepsRepository>(context, listen: false);
    final sleepRepo = Provider.of<SleepRepository>(context, listen: false);
    final caloriesRepo =
        Provider.of<CaloriesRepository>(context, listen: false);

    double stepsGoal = 0;

    final step = stepsRepo.weeklySteps;
    int count = 0;
    for (var s in step) {
      if (s.steps == 0) continue; // Data for that day were not available

      count += 1;

      if (s.steps >= Steps.maxGoal) {
        stepsGoal += 100;
        continue;
      }

      if (s.steps >= 0) {
        stepsGoal += (s.steps * 100 / Steps.maxGoal).floor();
      }
    }

    if (count > 0) stepsGoal = stepsGoal / count;

    final sleep = sleepRepo.weeklySleep;
    final maxMinutes = Sleep.maxGoal * 60;
    double sleepGoal = 0;
    count = 0;
    for (var s in sleep) {
      if (s.duration == 0) continue; // Data for that day were not available
      count += 1;

      final duration = s.duration / 60;

      if (duration >= maxMinutes) {
        sleepGoal += 100;
        continue;
      }

      if (duration >= 0) {
        sleepGoal += duration * 100 ~/ maxMinutes;
      }
    }
    if (count > 0) sleepGoal = sleepGoal / count;

    final cal = caloriesRepo.weeklyCalories;
    double caloriesGoal = 0;
    count = 0;
    for (var c in cal) {
      if (c.burned == 0) continue; // Data for that day were not available
      count += 1;

      if (c.burned.floor() >= getCaloriesGoal(caloriesRepo)) {
        caloriesGoal += 100;
        continue;
      }

      if (c.burned.floor() >= 0) {
        caloriesGoal +=
            (c.burned.floor() * 100 / getCaloriesGoal(caloriesRepo)).floor();
      }
    }
    caloriesGoal = caloriesGoal / count;

    print(((caloriesGoal + sleepGoal + stepsGoal) / 3).floor());

    return ((caloriesGoal + sleepGoal + stepsGoal) / 3).floor();
  }

  int getCaloriesGoal(CaloriesRepository repo) {
    final cal = repo.dailyCalories;

    if (cal != null) {
      return cal.getCaloriesEaten();
    }
    return 0;
  }
}
