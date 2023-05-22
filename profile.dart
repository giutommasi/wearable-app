import 'package:exam/Pages/widgets/profile/doctor.dart';
import 'package:exam/Pages/widgets/profile/home.dart';
import 'package:exam/Pages/widgets/profile/me.dart';
import 'package:exam/Pages/widgets/profile/notes.dart';
import 'package:flutter/material.dart';

class _ProfilePageState extends State<ProfilePage> {
  Color signInColor = Colors.white;
  Color signUpColor = Colors.pink.shade200;
  String nickNameExample = 'Alessandra';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScaffoldMessenger(
            child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile Page'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'close',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => HomePage()));
                },
              ),
            ],
          ),
        )));
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Container(
                    color: Color.fromARGB(255, 241, 126, 216),
                    child: Center(
                      child: ElevatedButton(
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('Me'),),
                      onPressed: () {
                    //cliccare su 'Me' per aprire la pagina
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => (MePage())));
                        }),
                      ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Container(
                    color: Color.fromARGB(255, 96, 185, 223),
                    child: Center(
                      child: ElevatedButton(
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('Doctor'),),
                      onPressed: () {
                    //cliccare su 'Doctor' per aprire la pagina
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => (DoctorPage())));
                      }),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]
      children:<Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Container(
                    color: Color.fromARGB(255, 96, 235, 96),
                    child: Center(
                      child: ElevatedButton(
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('Notes'),),
                      onPressed: () {
                    //cliccare su 'Notes' per aprire la pagina
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => (NotesPage())));
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
}