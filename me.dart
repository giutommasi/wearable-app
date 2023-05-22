import 'package:exam/Pages/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
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
            title: const Text('Me'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'close',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => ProfilePage()));
                },
              ),
            ],
          ),
        )));
  }
}
