import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_validation/pages/bem_vindo.dart';
import 'package:flutter_validation/constants/service_constants.dart';
import 'package:http/http.dart' as http;
import '../constants/error_constants.dart';

class LoginService {
  login(context, String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      http.Response response = await http.post(
        Uri.parse(ServiceConstants.login),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      if (response.statusCode == 200) {
        // Navigator.pushNamed(context, RoutesPage.bemVindo);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BemVindo(email: email)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(ErrorConstants.UserOrPasswordInvalid),
          ),
        );
      }
    }
  }
}
