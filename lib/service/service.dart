import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smash_test/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'package:smash_test/service/api_status.dart';

class service {
  static Future<Object> fetchCharacterApi() async {
    try {
      String url = "https://593cdf8fb56f410011e7e7a9.mockapi.io/fighters";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return Success(response: characterModelFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } catch (e) {
      return Failure(code: 103, errorResponse: 'Unknown Error');
      print(e);
    }
  }
}
