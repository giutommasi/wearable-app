import 'package:flutter_dotenv/flutter_dotenv.dart';

enum ImpactDataType { steps, calories, sleep }

class Impact {
  static String baseUrl = 'https://impact.dei.unipd.it/bwthw/';
  static String pingEndpoint = 'gate/v1/ping/';
  static String tokenEndpoint = 'gate/v1/token/';
  static String refreshEndpoint = 'gate/v1/refresh/';

  static String dataUrl = "data/v1/";
  static String patient = 'patients/Jpefaq6m58/';

  static String username = dotenv.env['IMPACT_USERNAME']!;
  static String password = dotenv.env['IMPACT_PASSWORD']!;

  static String dataEndpoint(ImpactDataType type, String day) {
    return '$baseUrl$dataUrl${type.name}/${patient}day/$day/';
  }

  static String dataEndpointRange(
      ImpactDataType type, String startDate, String endDate) {
    return '$baseUrl$dataUrl${type.name}$patient/daterange/start_date/$startDate/end_date/$endDate';
  }
}
