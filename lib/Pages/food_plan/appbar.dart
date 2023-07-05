import 'package:exam/Pages/food_plan.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final IconData? actions;
  final Color color;
  final bool page;

  const CustomAppBar({super.key, 
    required this.color,
    required this.title,
    required this.icon,
    required this.actions,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'PlayFair',
            fontSize: 26,
            fontWeight: FontWeight.normal,
            color: color,
            ),
        textAlign: TextAlign.center,
      ),
      leading: IconButton(
          onPressed: () {
            page == true? _PreviousPage(context) : _HomePage(context);
          },
          icon: Icon(
            icon,
            size: 24,
            color: color,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            actions,
            size: 24,
            color: color,
          ),
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}



// ###################################
void _PreviousPage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (const FoodPlanPage())));
}
void _HomePage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (const HomePage())));
}

