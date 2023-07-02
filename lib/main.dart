import 'package:exam/database/database.dart';
import 'package:exam/repositories/calories_repository.dart';
import 'package:exam/repositories/profile_repository.dart';
import 'package:exam/repositories/sleep_repository.dart';
import 'package:exam/repositories/steps_repository.dart';
import 'package:exam/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('database.db').build();
  final stepsRepository = StepsRepository(database: database);
  final caloriesRepository = CaloriesRepository(database: database);
  final sleepRepository = SleepRepository(database: database);
  final userRepository = UserRepository(database: database);
  final profileRepository = ProfileRepository(database: database);

  setupWindow();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<StepsRepository>(
          create: (context) => stepsRepository),
      ChangeNotifierProvider<CaloriesRepository>(
          create: (context) => caloriesRepository),
      ChangeNotifierProvider<SleepRepository>(
          create: (context) => sleepRepository),
      ChangeNotifierProvider<UserRepository>(
        create: (context) => userRepository,
      ),
      ChangeNotifierProvider<ProfileRepository>(
        create: (context) => profileRepository,
      )
    ],
    child: const App(),
  ));
}

const double windowWidth = 428;
const double windowHeight = 926;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Demo');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
