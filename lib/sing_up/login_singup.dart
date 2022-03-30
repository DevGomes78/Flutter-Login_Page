import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/routes.dart';
import 'package:flutter_validation/views/bem_vindo.dart';
import 'package:http/http.dart' as http;

class LoginService {
  login(context, String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      http.Response response = await http.post(
        Uri.parse(Routes.login),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, Routes.bemVindo);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario ou senha invalidos'),
          ),
        );
      }
    }
  }

}
