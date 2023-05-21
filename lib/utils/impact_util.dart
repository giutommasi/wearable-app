import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImpactUtil {
  static String baseUrl = 'https://impact.dei.unipd.it/bwthw/';
  static String pingEndpoint = 'gate/v1/ping/';
  static String tokenEndpoint = 'gate/v1/token/';
  static String refreshEndpoint = 'gate/v1/refresh/';

  static String username = dotenv.env['IMPACT_USERNAME']!;
  static String password = dotenv.env['IMPACT_PASSWORD']!;
}//Impact