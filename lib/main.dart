import 'package:exam/database/database.dart';
import 'package:exam/repositories/calories_repository.dart';
import 'package:exam/repositories/sleep_repository.dart';
import 'package:exam/repositories/steps_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'app.dart';

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

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<StepsRepository>(
          create: (context) => stepsRepository),
      ChangeNotifierProvider<CaloriesRepository>(
          create: (context) => caloriesRepository),
      ChangeNotifierProvider<SleepRepository>(
          create: (context) => sleepRepository),
    ],
    child: const App(),
  ));
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
