

import 'package:exam/Pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ProfilePage());
}

// ctrl K ctrl c     ctrl k ctrl U