import 'dart:async';
import 'package:exam/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'food_plan/appbar.dart';
import 'food_plan/body.dart';


class FoodPlanPage extends StatefulWidget {
  const FoodPlanPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FoodPlanState();
}


class _FoodPlanState extends State<FoodPlanPage> {
  bool isOpen = false;

 
  void toggleValue() {
    setState(() {
      isOpen = false;
    });
  }

  void handleClick() {
    setState(() {
      isOpen = true;
    });
    Timer(const Duration(seconds: 2), toggleValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(page: false, actions: Icons.import_contacts_outlined, icon: Icons.arrow_back, title: 'Food Plan', color: Colors.white),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Body(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: isOpen ? BuildExtendedButton() : BuildButton(),
      ),
    );
  }

  Widget BuildButton() => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
        width: 50,
        height: 50,
        child: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            foregroundColor: Colors.pink.shade200,
            onPressed: handleClick,
            icon: const Padding(
              padding: EdgeInsets.only(left: 11.0),
              child: Icon(Icons.email_outlined),
            ),
            label: const SizedBox(),
            elevation: 5),
      );

  Widget BuildExtendedButton() => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
        width: 200,
        height: 50,
        child: FloatingActionButton.extended(
          onPressed: () => launchEmail(
              toEmail:
                  'varotto.pd@gmail.com'), //Implemetare variabile mail dottore
          backgroundColor: Colors.white,
          foregroundColor: Colors.pink.shade200,
          icon: const Icon(Icons.email_outlined),
          label: const Center(child: Text('Contact my doctor')),
          elevation: 5,
          //mini: true,
        ),
      );

  Future launchEmail({required String toEmail}) async {
    final url = 'mailto:$toEmail';

    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}



void _HomePage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (const HomePage())));
}
