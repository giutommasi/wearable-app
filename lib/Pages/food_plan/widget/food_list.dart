import 'package:exam/Constants/colors.dart';
import 'package:flutter/material.dart';

import 'class.dart';

class FoodList extends StatelessWidget {
  final int selected, count;
  final Function callback;
  //final Meal food;

  const FoodList(this.count, this.selected, this.callback, {super.key});

  //rest.menu.keys.tolist
  @override
  Widget build(BuildContext context) {
    
    //String meals = weeklyMeals[0].mealType;
    return Container(
      //color: Colors.yellow,
      height: 65,
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => callback(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: gradientEnd),
              borderRadius: BorderRadius.circular(20),
              color: selected == index? gradientEnd : Colors.white,
            ),
            child: Center(
              child: Text(
                weeklyMeals1[index].mealType, style: TextStyle(fontSize: 15, fontWeight: selected == index? FontWeight.normal : FontWeight.bold, color: selected == index? Colors.white : gradientEnd),
              ),
            ),
          ),
        ), 
        separatorBuilder: (_,index) => const SizedBox(width: 14,), 
        itemCount: 6)
      
     
    
      );
  }
}