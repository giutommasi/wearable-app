import 'package:exam/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'class.dart';

class FoodListView extends StatefulWidget {
  final int count;
  final int selected;
  final Function callback;
  final PageController pageController;

  const FoodListView(this. count,this.selected, this.callback, this.pageController, {super.key});
  @override
  _FoodListViewState createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  List<bool> isExpandedList = [];

  @override
  void initState() {
    super.initState();
    int totalFoodsCount = 0;
    for (var meal in Week[widget.count].weeklyMeals) {
      totalFoodsCount += meal.foods.length;
    }
    isExpandedList = List<bool>.filled(totalFoodsCount, false);
  }

  Future<void> toggleExpansion(int index) async {
    setState(() {
      isExpandedList[index] = !isExpandedList[index];
    });

    int totalFoodsCount = 0;
    for (var meal in Week[widget.count].weeklyMeals) {
      totalFoodsCount += meal.foods.length;
    }

    if (isExpandedList.length < totalFoodsCount) {
      setState(() {
        isExpandedList.addAll(
            List<bool>.filled(totalFoodsCount - isExpandedList.length, false));
      });
    }

    await Future.microtask(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final W = size.width;
    final List<Food> selectedFoods = Week[widget.count].weeklyMeals[widget.selected].foods;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: PageView(
        controller: widget.pageController,
        onPageChanged: (index) => widget.callback(index),
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    itemBuilder: (context, index) {
                      
                      final food = selectedFoods[index];
                      print(food);
                      final isExpanded = isExpandedList[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isExpandedList[index] = !isExpanded;
                          });
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: gradientEnd,
                              backgroundImage: AssetImage(
                                  weeklyMeals1[widget.selected]
                                      .foods[index]
                                      .path),
                            ),
                            const SizedBox(width: 10),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, top: 10),
                              height: isExpanded ? 235 : 85,
                              width: W * 0.65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: gradientEnd),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(113, 158, 158, 158),
                                    //spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 0.5),
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(selectedFoods[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        Icon(
                                          isExpanded
                                              ? Icons.keyboard_arrow_down
                                              : Icons.keyboard_arrow_right,
                                          size: 25,
                                        )
                                      ],
                                    ),
                                    Text(
                                      '${selectedFoods[index].weight} ${selectedFoods[index].unit}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${selectedFoods[index].kCal} kCal',
                                            style: const TextStyle(
                                                color: fontColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Row(
                                            children: [
                                              Icon(Icons.mode_edit_outline,
                                                  size: 20, color: gradientEnd),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.delete_outlined,
                                                color: Colors.red,
                                                size: 20,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    if (isExpanded)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5),
                                          const Row(
                                            children: [
                                              Expanded(
                                                child: Divider(
                                                  color: gradientEnd,
                                                  thickness: 1,
                                                  height: 10,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 7),
                                                child: Text(
                                                  'Details',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Divider(
                                                  color: gradientEnd,
                                                  thickness: 1,
                                                  height: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          if (food.details != null)
                                            Row(
                                              children: [
                                                const Icon(Icons.info_outline_rounded, color: gradientEnd,),
                                                const SizedBox(width: 10),
                                                Text(
                                                  '${food.details}',
                                                  style:
                                                      const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              const Icon(Icons.add_circle, color: Colors.blueAccent, ),
                                              const SizedBox(width: 10),
                                              Text(
                                                'Protein: ${food.prot.toString()}g',
                                                style:
                                                    const TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              const Icon(Icons.add_circle, color: Colors.yellowAccent, ),
                                              const SizedBox(width: 10),
                                              Text(
                                                'Carbohydrates: ${food.carbs.toString()}g',
                                                style:
                                                    const TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              const Icon(Icons.add_circle, color: Colors.redAccent, ),
                                              const SizedBox(width: 10),
                                              Text(
                                                'Fat: ${food.fat.toString()}g',
                                                style:
                                                    const TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(height: 15),
                    itemCount: weeklyMeals1[widget.selected].foods.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
