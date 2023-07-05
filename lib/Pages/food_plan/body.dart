import 'package:exam/Pages/dailyPlan1.dart';
import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import 'package:exam/Pages/food_plan/widget/widgetFoodplan.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSnackbar(BuildContext context) {
  const snackbar = SnackBar(
    content: Text('Download...'),
    duration: Duration(seconds: 2),
    backgroundColor: gradientEnd,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}


class _BodyState extends State<Body>{
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final H = size.height;
    final W = size.width;
    
    return Container(
      height: H, //Ritorna dimensioni telefono attuale
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          gradientStart,
          gradientEnd,
        ], begin: FractionalOffset(0.0, 0.0), end: FractionalOffset(1.0, 1.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: H*0.07),
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30), bottom: Radius.circular(10)),
                color: Colors.white.withOpacity(0.15),
                border:
                    Border.all(width: 1, color: Colors.white.withOpacity(0.4)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(-3, 3),
                  )
                ]),
            height: H * 0.70,
            width: W * 0.95,
            child: Column(
              children: [
                Expanded(
                    child: GridView.builder( //########################################
                      padding: const EdgeInsets.only(top: 1, bottom: 1),
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        ), 
                     itemBuilder: (context, index) 
                      {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => DailyPlan1(count: index))));},
                          child: PlanCard(products: products[index],));
                      }
                      ),
                ),
              ],
            ),
          ),
           const SizedBox(height: 2),
           const Divider(
            height: 2.0,
            color: Colors.white,
            thickness: 0.5,
            indent: 35,
            endIndent: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.upload_file_outlined),
                color: Colors.white,
                onPressed: () {
                  showSnackbar(context);
                },
              ),
              TextButton(
                onPressed: () {
                  showSnackbar(context);
                },
                child: const Text('Import new Food Plan',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.download_outlined),
                color: Colors.white,
                onPressed: () {
                  showSnackbar(context);
                },
              ),
              TextButton(
                onPressed: () {
                  showSnackbar(context);
                },
                child: const Text('Download pdf',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
              )
            ],
          ),
      
        
        ],
      ),
    );
  }
}


class PlanCard extends StatefulWidget {
  final DailyPlanItem products;
  // //final Function press;
  PlanCard({required this.products});

  @override
  _PlanCardState createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {

  void initState() {
    super.initState();
    restoreSavedValues();
  }

  void restoreSavedValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    for (var item in products) {
      item.favorite = prefs.getBool('favorite_${item.dayNumb}') ?? false;
    }
  });
}


  @override
  Widget build(BuildContext context) {
    const double HEIGHT = 160;
    const double WIDTH = 160;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: HEIGHT,
              width: WIDTH,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow (
                    color: Colors.grey,
                    //spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(-2, 2),
                  ),
                ],
                color: widget.products.color.withOpacity(0.90),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                Container(
                  height: HEIGHT * 0.75,
                  child: Stack(
                    children: [
                    Positioned(
                      right: 0.1,
                      child: 
                        widget.products.starred? const Text('') :
                      IconButton(
                        icon: Icon(
                            widget.products.favorite
                                ? Icons.star
                                : Icons.star_border_outlined,
                            color: widget.products.favorite
                                ? Colors.orange.shade600
                                : Colors.white,
                            ),
                        iconSize: 22,
                        onPressed: () async {
                          setState(() {
                            widget.products.favorite = !widget.products.favorite;
                          });

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('favorite_${widget.products.dayNumb}', widget.products.favorite);
                        }
                      ),
                    ),
                    Center(
                      child:
                        widget.products.starred? Icon(Icons.star_border_outlined, size : 90, color: Colors.white.withOpacity(0.9),)  :
                        Text(
                        widget.products.dayNumb,
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 15, right: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  height: HEIGHT * 0.25,
                  width: WIDTH,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.products.dayString, style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: 
                          widget.products.training
                            ? const Icon(Icons.fitness_center_outlined, size: 24, color: Colors.green)
                            : const Text(''),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}


