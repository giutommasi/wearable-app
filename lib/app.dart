import 'package:exam/progress_trace/progress_trace_screen.dart';
import 'package:flutter/material.dart';

import 'Pages/profile_page.dart';
import 'Pages/welcome_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'App for Pregnant Woman',
        debugShowCheckedModeBanner: false,
        home: const WelcomePage(),
        routes: {
          "/progress/": (context) => const ProgressTraceScreen(),
          "/account/": (context) => const ProfilePage()
        },
      );
}
