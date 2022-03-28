import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/routes.dart';
import 'package:flutter_validation/views/bem_vindo.dart';
import 'package:http/http.dart' as http;

class SingUpService {
  singUp(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes.singUp),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 200) {

    }
  }
}
