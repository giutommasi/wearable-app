import 'dart:convert';
import 'dart:io';

import 'package:exam/Constants/impact.dart';
import 'package:exam/database/entities/sleep.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../database/entities/calories.dart';
import '../database/entities/steps.dart';
import 'impact_auth.dart';

class ImpactApi {
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');

  static Future<List<Steps>?> getStepsRange(
      DateTime startDate, DateTime endDate) async {
    List<Steps>? steps;
    Response response = await _getData(ImpactDataType.steps,
        formatter.format(startDate), formatter.format(endDate));

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      steps = [];

      for (var i = 0; i < decodedResponse['data'].length; i++) {
        final json = decodedResponse['data'][i];
        final date = DateFormat('yyyy-MM-dd').parse('${json["date"]}');

        if (decodedResponse['data'][i]['data'] is List &&
            (decodedResponse['data'][i]['data'] as List).isEmpty) {
          steps.add(Steps(date: date, steps: 0, last: date));
          continue;
        } else if (decodedResponse['data'][i]['data'] is Map &&
            (decodedResponse['data'][i]['data'] as Map).isEmpty) {
          steps.add(Steps(date: date, steps: 0, last: date));
          continue;
        }

        steps.add(Steps.fromJson(decodedResponse['data'][i]));
      }
      return steps;
    }

    debugPrint(
        "Failed to get steps for range $startDate $endDate, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<List<Calories>?> getCaloriesRange(
      DateTime startDate, DateTime endDate) async {
    List<Calories>? calories;
    Response response = await _getData(ImpactDataType.calories,
        formatter.format(startDate), formatter.format(endDate));

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      calories = [];

      for (var i = 0; i < decodedResponse['data'].length; i++) {
        final json = decodedResponse['data'][i];
        final date = DateFormat('yyyy-MM-dd').parse('${json["date"]}');

        if (decodedResponse['data'][i]['data'] is List &&
            (decodedResponse['data'][i]['data'] as List).isEmpty) {
          calories.add(Calories(
              date: DateFormat('yyyy-MM-dd').parse('${date}'),
              burned: 0,
              dayOfTheWeek: 1));
          continue;
        } else if (decodedResponse['data'][i]['data'] is Map &&
            (decodedResponse['data'][i]['data'] as Map).isEmpty) {
          calories.add(Calories(
              date: DateFormat('yyyy-MM-dd').parse('${date}'),
              burned: 0,
              dayOfTheWeek: 1));
          continue;
        }

        calories.add(Calories.fromJson(json));
      }

      return calories;
    }

    debugPrint(
        "Failed to get Calories for range $startDate $endDate, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<List<Sleep>?> getSleepRange(
      DateTime startDate, DateTime endDate) async {
    List<Sleep>? sleep;
    Response response = await _getData(ImpactDataType.sleep,
        formatter.format(startDate), formatter.format(endDate));

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      sleep = [];

      for (var i = 0; i < decodedResponse['data'].length; i++) {
        final json = decodedResponse['data'][i];
        final date = DateFormat('yyyy-MM-dd').parse('${json["date"]}');

        if (decodedResponse['data'][i]['data'] is List &&
            (decodedResponse['data'][i]['data'] as List).isEmpty) {
          sleep.add(Sleep(
              startTime: date,
              endTime: date,
              minutesAsleep: 0,
              minutesAwake: 0,
              efficiency: 0,
              date: date,
              duration: 0));
          continue;
        } else if (decodedResponse['data'][i]['data'] is Map &&
            (decodedResponse['data'][i]['data'] as Map).isEmpty) {
          sleep.add(Sleep(
              startTime: date,
              endTime: date,
              minutesAsleep: 0,
              minutesAwake: 0,
              efficiency: 0,
              date: date,
              duration: 0));
          continue;
        }

        if (json["data"] is List) {
          sleep.add(Sleep.fromJson(
              date,
              json["data"]
                  [0])); // Apit sometimets return a List and sometimes a Map
        } else {
          sleep.add(Sleep.fromJson(
              date,
              json[
                  "data"])); // Apit sometimets return a List and sometimes a Map
        }
      }

      return sleep;
    }

    debugPrint(
        "Failed to get sleep for range $startDate $endDate, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<Steps?> getSteps(DateTime day) async {
    Response response =
        await _getData(ImpactDataType.steps, formatter.format(day), null);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['data'] is List &&
          (decodedResponse['data'] as List).isEmpty) return null;
      if (decodedResponse['data'] is Map &&
          (decodedResponse['data'] as Map).isEmpty) return null;

      return Steps.fromJson(decodedResponse['data']);
    }

    debugPrint(
        "Failed to get steps for day $day, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<Calories?> getCalories(DateTime day) async {
    Response response =
        await _getData(ImpactDataType.calories, formatter.format(day), null);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['data'] is List &&
          (decodedResponse['data'] as List).isEmpty) return null;
      if (decodedResponse['data'] is Map &&
          (decodedResponse['data'] as Map).isEmpty) return null;

      return Calories.fromJson(decodedResponse['data']);
    }

    debugPrint(
        "Failed to get calories for day $day, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<Sleep?> getSleep(DateTime day) async {
    Response response =
        await _getData(ImpactDataType.sleep, formatter.format(day), null);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final json = decodedResponse['data'];

      if (decodedResponse['data'] is List &&
          (decodedResponse['data'] as List).isEmpty) return null;
      if (decodedResponse['data'] is Map &&
          (decodedResponse['data'] as Map).isEmpty) return null;

      if (json["data"] is List) {
        return Sleep.fromJson(
            DateFormat('yyyy-MM-dd').parse('${json["date"]}'),
            json["data"]
                [0]); // Apit sometimets return a List and sometimes a Map
      } else {
        return Sleep.fromJson(DateFormat('yyyy-MM-dd').parse('${json["date"]}'),
            json["data"]); // Apit sometimets return a List and sometimes a Map
      }
    }

    debugPrint(
        "Failed to get sleep for day $day, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<Response> _getData(
      ImpactDataType type, String startDate, String? endDate) async {
    //Get the stored access token
    final sp = await SharedPreferences.getInstance();
    var access = sp.getString('access');

    //If access token is expired, refresh it
    if (access == null || JwtDecoder.isExpired(access)) {
      await ImpactAuth.refreshTokens();
      access = sp.getString('access');
    } //if

    //Create the (representative) request
    String url;
    if (endDate == null) {
      url = Impact.dataEndpoint(type, startDate);
    } else {
      url = Impact.dataEndpointRange(type, startDate, endDate);
    }
    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    //Get the response
    debugPrint('Calling: $url');
    final response = await http.get(Uri.parse(url), headers: headers);

    return response;
  }
}
