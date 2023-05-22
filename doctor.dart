import 'package:exam/Pages/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

class _DoctorPageState extends State<DoctorPage> {
  Color signInColor = Colors.white;
  Color signUpColor = Colors.pink.shade200;
  String nickNameExample = 'Dott.ssa Rossi';
  int index = -1;
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
            title: const Text('Doctor Page'),
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

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DoctorPageState();
}

@override
int index = -1;
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (i, isOpen) {
            setState(() {
              if (index == i)
                index = -1;
              else
                index = i;
            });
          },
          animationDuration: Duration(seconds: 1),
          dividerColor: Colors.teal,
          elevation: 2,
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("Telephone"),
                );
              },
              canTapOnHeader: true,
              body: ListTile(
                title: Text("333*******"),
              ),
              isExpanded: index == 0,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("E-mail"),
                );
              },
              body: ListTile(
                title: Text("dottoressarossi@gmail.it"),
              ),
              isExpanded: index == 1,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("Address"),
                );
              },
              canTapOnHeader: true,
              body: ListTile(
                title: Text("Via Garibaldi 30, Padova, PD"),
              ),
              isExpanded: index == 2,
            ),
          ],
        ),
      ),
    ),
  );
}

void setState(Null Function() param0) {}
