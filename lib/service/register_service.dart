import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/service_constants.dart';
import 'package:flutter_validation/constants/string_constants.dart';
import 'package:http/http.dart' as http;
import '../constants/error_constants.dart';

class RegisterLoginService {
  singUp(context, String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(ServiceConstants.singUp),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(StringConstants.registerSucess),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(ErrorConstants.errorRegister),
        ),
      );
    }
  }
}
