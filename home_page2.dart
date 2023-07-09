import 'package:date_format/date_format.dart';
import 'package:exam/Constants/colors.dart';
import 'package:exam/Pages/welcome_page.dart';
import 'package:exam/Pages/widgets/web.dart';
import 'package:exam/Pages/widgets/weekTips.dart';
// import 'package:exam/database/entities/user.dart';
// import 'package:exam/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
// import '../database/entities/profile.dart';
// import '../repositories/user_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Color signInColor = Colors.white;
  Color signUpColor = Colors.pink.shade200;
  bool isFemale = true; //Da inserire icona in profilo
  String? pageTitle;
  int currentWeek = 1;

  

  String? getWeekUrl() {
  final currentWeek = int.parse(formatDate(DateTime.now(), [W])); // Ottieni la settimana corrente
  for (var weekUrl in pregnancyWeeks) {
    if (weekUrl.week == currentWeek) {
      return weekUrl.link;
    }
  }
  return null; // Se non viene trovato nessun URL per la settimana corrente
}

  
  // late User user;
  // late Profile profile;

  // @override
  // void initState() {
  //   super.initState();
  //   final userRepo = Provider.of<UserRepository>(context, listen: false);
  //   user = userRepo.signedUser;
  //   final profileRepo = Provider.of<ProfileRepository>(context, listen: false);
  //   profile = profileRepo.signedProfile;
  // }



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
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: H.toDouble() * 0.08,
                              child: CircleAvatar(
                                  radius: (W.toDouble()) *
                                      0.10, //dimensione proporzionale allo schermo
                                  backgroundImage:
                                      const AssetImage('assets/profile.png')),
                            ),
                            SizedBox(width: W.toDouble() * 0.05),
                            Consumer(
                              builder: (context, userRepo, child) {
                                return const Text(
                                    'Hi name!',//CAMBIATPPPPP,
                                    style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.w300));
                              },
                            ),
                          ]),
                      SizedBox(height: H.toDouble() * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildBox(
                              height: H,
                              width: W,
                              imageUrl: 'assets/healthFood.jpg',
                              title: 'Food Tips',
                              subtitle: 'How to eat well:',
                              url: categories[0].websites[DateTime.now().day %
                                  categories[0].websites.length],
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: _buildBox(
                              height: H,
                              width: W,
                              imageUrl: 'assets/fitness.jpg',
                              title: 'Fitness Tips',
                              subtitle: 'How to feel better:',
                              url: categories[1].websites[DateTime.now().day %
                                  categories[1].websites.length],
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: _buildBox(
                              height: H,
                              width: W,
                              imageUrl: 'assets/sleep.jpg',
                              title: 'General Tips',
                              subtitle: 'How to deal with it:',
                              url: categories[2].websites[DateTime.now().day %
                                  categories[2].websites.length],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: H.toDouble() * 0.03),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),
                        height: 55,
                        width: W * 0.90,
                        child: Row(
                          children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                )),
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.center,
                            width: 84,
                            height: 55,
                            child: Text('Week: ${currentWeek.toString()}'),
                          ),
                          SizedBox(
                            height: 40,
                            width: 0.3,
                            child: Container(color: Colors.black),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text('Titolo url: ${getWeekUrl() ?? 'URL non disponibile'}'),
                          ),
                        ]),
                      ),
                      SizedBox(height: H.toDouble() *0.02,),
                      SizedBox(
                        height: H.toDouble() * 0.04,
                        child: const Text(
                          'Week 3', //CAMBIATOOOOOOOO
                          style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w300,),),
                      ),
                      Card(
                          color: Colors.white,
                          clipBehavior: Clip.hardEdge,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: H.toDouble() * 0.3,
                                    width: W.toDouble() * 0.6,
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/baby.png'))), //Non sarà const la variabile
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
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.75, // 75% of screen will be occupied
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Consumer(builder: (context, userRepo, child) {
                  return UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            gradientStart,
                            gradientEnd,
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0)),
                    ),
                    accountName: Text(
                        "NICO VAROTTO"),
                    accountEmail: Text('userRepo.signedUser.username'),
                    currentAccountPicture: CircleAvatar(
                        radius: (W.toDouble()) *
                            0.15, //dimensione proporzionale allo schermo
                        backgroundImage:
                            const AssetImage('assets/profile.png')),
                  );
                }),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () async {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (c) => WelcomePage()),
                        (route) => false);
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('username', '');
                  },
                ),
              ],
            ),
          ),
        ),
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          },
                          child: Column(
                            children: [
                              Icon(Icons.home_outlined,
                                  color: Colors.pink.shade200),
                              Text('Home',
                                  style:
                                      TextStyle(color: Colors.pink.shade200)),
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
                          onPressed: () async {
                            await Navigator.pushNamed(context, "/food_plan/");
                          },
                          child: Column(
                            children: [
                              Icon(Icons.description_outlined,
                                  color: Colors.pink.shade200),
                              Text('Food Plan',
                                  style:
                                      TextStyle(color: Colors.pink.shade200)),
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
                          onPressed: () async {
                            final result = await Navigator.pushNamed(
                                context, "/progress/");
                            // When a BuildContext is used from a StatefulWidget, the mounted property
                            // must be checked after an asynchronous gap.
                            if (!mounted) return;

                            // After the Selection Screen returns a result, hide any previous snackbars
                            // and show the new result.
                            if (result != null && result != "") {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(
                                    SnackBar(content: Text(result as String)));
                            }
                          },
                          child: Column(
                            children: [
                              Icon(Icons.trending_up_outlined,
                                  color: Colors.pink.shade200),
                              Text('Progress',
                                  style:
                                      TextStyle(color: Colors.pink.shade200)),
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
                          onPressed: () async {
                            await Navigator.pushNamed(context, "/account/");
                          },
                          child: Column(
                            children: [
                              Icon(Icons.account_circle_outlined,
                                  color: Colors.pink.shade200),
                              Text('Account',
                                  style:
                                      TextStyle(color: Colors.pink.shade200)),
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

Widget _buildBox({
  required String imageUrl, 
  required String title, 
  required String subtitle, 
  required String url, 
  required height, 
  required width,
  }) {
    
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Container(
        width: width*0.35,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                ),
              child: Image.asset(imageUrl, 
                fit: BoxFit.fitWidth,
                height: 140,
                width: 180,)),
          Container(
            width: 180,
            height: 67,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight:  Radius.circular(15),),
              color: Colors.white,
              
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:6.0, top: 2, right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                      Icon(Icons.lightbulb, size: 19, color: Colors.amber,)
                    ],
                  ),
                  FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(subtitle, style: TextStyle(color: gradientEnd),))
                ],
              ),
            ),
            )
        ]),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
