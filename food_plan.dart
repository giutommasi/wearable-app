import 'package:flutter/material.dart';

class FoodPlan extends StatefulWidget {
  const FoodPlan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FoodPlanState();
}

class _FoodPlanState extends State<FoodPlan> {
  Color signInColor = Colors.white;
  Color signUpColor = Colors.pink.shade200;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector();
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('My Food Plan'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {print ('Your Daily Plan'); }         
            )
            child: Column(
              children: [
                AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 3),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(colazione.jpg)),
                    ),
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text('Breakfast')),
                AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 3),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(pranzo.jpg)),
                    ),
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text('Lunch')),
                AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 3),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(cena.jpg)),
                    ),
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text('Dinner')
                )
                ]
            )
        )
    );
}