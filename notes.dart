import 'package:exam/Pages/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

class _NotesPageState extends State<NotesPage> {
  Color signInColor = Colors.white;
  Color signUpColor = Colors.pink.shade200;
  List<String> options = <String>[
    'hospital',
    'ball',
    'cat',
    'dog',
    'baby',
    'bag',
    'mom',
    'baby bottle',
    'pacifier',
    'badsheets',
    'hospital bag'
  ];

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
            title: const Text('Notes Page'),
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

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  get options => null;
  @override
  State<StatefulWidget> createState() => _NotesPageState();

  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return options.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(selection),
              ),
            );
          },
        ),
      ),
    );
  }
}
