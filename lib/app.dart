import 'package:flutter/material.dart';

import 'Pages/welcome_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'App for Pregnant Woman',
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      );
}
