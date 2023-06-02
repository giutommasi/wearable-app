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
      ImpactDataType type, DateTime startDate, DateTime endDate) async {
    List<Steps>? steps;
    Response response = await _getData(
        type, formatter.format(startDate), formatter.format(endDate));

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      steps = [];

      if (type == ImpactDataType.steps) {
        for (var i = 0; i < decodedResponse['data'].length; i++) {
          if ((decodedResponse['data'][i]['data'] as List).isEmpty) continue;

          steps.add(Steps.fromJson(decodedResponse['data'][i]));
        }
        return steps;
      }
    }

    debugPrint(
        "Failed to get steps for range $startDate $endDate, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<List<Calories>?> getCaloriesRange(
      ImpactDataType type, DateTime startDate, DateTime endDate) async {
    List<Calories>? calories;
    Response response = await _getData(
        type, formatter.format(startDate), formatter.format(endDate));

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      calories = [];

      if (type == ImpactDataType.calories) {
        for (var i = 0; i < decodedResponse['data'].length; i++) {
          if ((decodedResponse['data'][i]['data'] as List).isEmpty) continue;

          calories.add(Calories.fromJson(decodedResponse['data'][i]));
        }

        return calories;
      }
    }

    debugPrint(
        "Failed to get Calories for range $startDate $endDate, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<List<Sleep>?> getSleepRange(
      ImpactDataType type, DateTime startDate, DateTime endDate) async {
    List<Sleep>? sleep;
    Response response = await _getData(
        type, formatter.format(startDate), formatter.format(endDate));

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      sleep = [];

      if (type == ImpactDataType.sleep) {
        for (var i = 0; i < decodedResponse['data'].length; i++) {
          if ((decodedResponse['data'][i]['data'] as List).isEmpty) continue;

          sleep.add(Sleep.fromJson(decodedResponse['data'][i]));
        }

        return sleep;
      }
    }

    debugPrint(
        "Failed to get sleep for range $startDate $endDate, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<Steps?> getSteps(ImpactDataType type, DateTime day) async {
    Response response = await _getData(type, formatter.format(day), null);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (type == ImpactDataType.steps) {
        if ((decodedResponse['data'] as List).isEmpty) return null;

        return Steps.fromJson(decodedResponse['data']);
      }
    }

    debugPrint(
        "Failed to get steps for day $day, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<Calories?> getCalories(
      ImpactDataType type, DateTime day) async {
    Response response = await _getData(type, formatter.format(day), null);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (type == ImpactDataType.calories) {
        if ((decodedResponse['data'] as List).isEmpty) return null;

        return Calories.fromJson(decodedResponse['data']);
      }
    }

    debugPrint(
        "Failed to get calories for day $day, http response was ${response.statusCode} and body ${response.body}");

    return null;
  }

  static Future<Sleep?> getSleep(ImpactDataType type, DateTime day) async {
    Response response = await _getData(type, formatter.format(day), null);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if ((decodedResponse['data'] as List).isEmpty) return null;

      if (type == ImpactDataType.sleep) {
        return Sleep.fromJson(decodedResponse['data']);
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
