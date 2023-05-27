import 'dart:convert';

import 'package:flutter/material.dart';

import 'impact_const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Impact {
  //This method allows to check if the IMPACT backend is up
  static Future<bool> isUp() async {
    //Create the request
    final url = ImpactConst.baseUrl + ImpactConst.pingEndpoint;

    //Get the response
    debugPrint('Calling: $url');
    final response = await http.get(Uri.parse(url));

    //Just return if the status code is OK
    return response.statusCode == 200;
  } //_isImpactUp

  //This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
  static Future<int> getAndStoreTokens() async {
    //Create the request
    final url = ImpactConst.baseUrl + ImpactConst.tokenEndpoint;
    final body = {
      'username': ImpactConst.username,
      'password': ImpactConst.password
    };

    //Get the response
    debugPrint('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If response is OK, decode it and store the tokens. Otherwise do nothing.
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      await sp.setString('access', decodedResponse['access']);
      await sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Just return the status code
    return response.statusCode;
  } //_getAndStoreTokens

  //This method allows to refrsh the stored JWT in SharedPreferences
  static Future<int> refreshTokens() async {
    //Create the request
    final url = ImpactConst.baseUrl + ImpactConst.refreshEndpoint;
    final sp = await SharedPreferences.getInstance();
    final refresh = sp.getString('refresh');
    final body = {'refresh': refresh};

    //Get the response
    debugPrint('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If the response is OK, set the tokens in SharedPreferences to the new values
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      await sp.setString('access', decodedResponse['access']);
      await sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Just return the status code
    return response.statusCode;
  } //_refreshTokens
}
