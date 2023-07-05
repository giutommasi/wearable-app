import 'package:exam/Pages/widgets/login.dart';
import 'package:exam/Pages/widgets/sing_up.dart';
import 'package:exam/misc/bubble_indicator_painter.dart';
import 'package:flutter/material.dart';
import '../Constants/button.dart';
import '../Constants/colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late PageController _pageController;

  bool pageLogin = true;
  Color signInColor = Colors.white;
  Color signUpColor = Colors.pink.shade200;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height, //Ritorna dimensioni telefono attuale
            width: MediaQuery.of(context).size.width,
            //padding: const EdgeInsets.only(bottom: 25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    gradientStart,
                    gradientEnd,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 1.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
              _logoWidget(),
              const SizedBox(height: 22),
              _selectorWidget(),
              const SizedBox(height: 30),
              _pageViewWidget(),
            ]),
          ),
        ),
      );


Widget _logoWidget() => const Padding(
      padding: EdgeInsets.only(top: 50), //SArebbbe 50
      child: Image(
        image: AssetImage('assets/logo.png'),
        height: 190,
      ),
    );

Widget _selectorWidget() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink.shade300, width: 0.6),
              color: Colors.white,//Colors.pink.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(
                  aBorder))), //Creo un container di forma arrotondata
          width: 300,
          height: 50,
          child: CustomPaint(
            painter: BubbleIndicatorPainter(pageController: _pageController),
            child: Row(
              //nella stessa fila, pongo due TxtButton
              //Spaceevenly permette di distribuirli nel container lasciando spazio
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () => _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: signInColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () => _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.decelerate,
                    ),
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: signUpColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

Widget _pageViewWidget() => 
SizedBox(
  height: 500,//pageLogin? 350 : 800,
      child: PageView(
        onPageChanged: (index) {
          setState(() {
            pageLogin? true : false;
            signInColor = index == 0? Colors.white : Colors.pink.shade200;
            signUpColor = index == 1? Colors.white : Colors.pink.shade200;
          });
        },
        controller: _pageController,
        children: const [
          Login(),
          SignUp(),
        ],
      ),
    );
    
}
