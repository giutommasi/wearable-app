import 'package:exam/Constants/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color signInColor = Colors.white;
  Color signUpColor = Colors.pink.shade200;
  bool isFemale = true; //Da inserire icona in profilo
  String nickNameExample = 'Alessandra';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final H = size.height;
    final W = size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(  
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: const [
            Padding(
              padding: EdgeInsets.all(15),
              child: Icon(
                Icons.family_restroom_outlined,
                size: 35,
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          height: size.height, //Ritorna dimensioni telefono attuale
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  gradientStart,
                  gradientEnd,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 45, right: 20),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: H.toDouble()*0.2,
                              child: CircleAvatar(
                                radius: (W.toDouble())*0.15,    //dimensione proporzionale allo schermo
                                backgroundImage: const AssetImage('assets/profile.png')
                              ),
                            ),
                            SizedBox(width: W.toDouble()*0.05),
                            const Text('Ciao \nNome!',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w200)),
                          ]),
                      SizedBox(height: H.toDouble()*0.05),
                      SizedBox(height: H.toDouble()*0.05, child: const Text('N settimana', style: TextStyle(fontSize: 26)),),
                      Card(
                        color: Colors.white,
                        clipBehavior: Clip.hardEdge, 
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: H.toDouble()*0.45, width: W.toDouble()*0.7, child: const Image(image: AssetImage('assets/baby.png'))), //Non sarà const la variabile
                            ],
                          ),
                        ))
                    ],
                  ),
                ),
                const Text(''),
              ],
            ),
          ),
        ),
        drawer: Expanded(child: Text('')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: isFemale ? ColorFemale : ColorMale,
          foregroundColor:
              isFemale ? Colors.pink.shade200 : Colors.blue.shade200,
          elevation: 0,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: _BottomBar(),
      ),
    );
  }

Widget _BottomBar() => ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: BottomAppBar(
          elevation: 5,
          notchMargin: 8.0,
          shape: const CircularNotchedRectangle(),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));},
                        child: Column(
                          children: [
                            Icon(Icons.home_outlined,
                                color: Colors.pink.shade200),
                            Text('Home',
                                style: TextStyle(color: Colors.pink.shade200)),
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(Icons.description_outlined,
                                color: Colors.pink.shade200),
                            Text('Food Plan',
                                style: TextStyle(color: Colors.pink.shade200)),
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(Icons.trending_up_outlined,
                                color: Colors.pink.shade200),
                            Text('Progress',
                                style: TextStyle(color: Colors.pink.shade200)),
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(Icons.account_circle_outlined,
                                color: Colors.pink.shade200),
                            Text('Account',
                                style: TextStyle(color: Colors.pink.shade200)),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
}