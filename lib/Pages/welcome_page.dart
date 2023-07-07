import 'package:pregnancy_health/Constants/button.dart';
import 'package:pregnancy_health/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/colors.dart';
import '../repositories/user_repository.dart';
import 'authentication.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isFirstAccess = true;
  bool _signed = false;

  @override
  void initState() {
    super.initState();
    _checkFirstAccess();
  }

  Future<void> signedIn() async {
    final userRepo = Provider.of<UserRepository>(context, listen: false);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');

    if (username != null && username.isNotEmpty) {
      final success = await userRepo.selectSignedUser(username);
      setState(() {
        _signed = success;
      });
    }
  }

  Future<void> _checkFirstAccess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstAccess = prefs.getBool('is_first_access') ?? true;
    setState(() {
      _isFirstAccess = isFirstAccess;
    });
    await prefs.setBool('is_first_access', false);
  }

  @override
  Widget build(BuildContext context) {
    if (_signed) {
      return const HomePage();
    } else if (_isFirstAccess == false) {
      return const AuthPage();
    } else {
      Size size = MediaQuery.of(context).size;
      return Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  //gradientMiddle,
                  gradientStart,
                  gradientEnd,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0)),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              _welcomeWidget(),
              _signInButton(context),
            ],
          ),
        ),
      );
    }
  }

  Widget _welcomeWidget() =>
      const Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/in.png'), fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.only(top: 13),
              child: Column(
                children: [
                  Text(
                    'Pregnancy Health',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 2.0,
                          color: Colors.white,
                          thickness: 0.5,
                          indent: 45,
                          endIndent: 35,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          height: 2.0,
                          color: Colors.white,
                          thickness: 0.5,
                          indent: 35,
                          endIndent: 45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]);

  Widget _signInButton(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 7,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(aBorder)),
          backgroundColor: Colors.white),
      onPressed: () {
        Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AuthPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 75.0, vertical: 8.0),
        child: const Text("Let's Start",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(255, 159, 14, 91))),
      ));
}
