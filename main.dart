import 'package:exam/Pages/widgets/profile/home.dart';
import 'package:exam/Pages/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), routes: {
      '/homepage': (contex) => HomePage(),
      '/account': (context) => ProfilePage(),
    });
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
    );
  }
}
