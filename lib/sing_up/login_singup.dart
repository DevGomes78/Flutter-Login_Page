import 'dart:convert';

import 'package:flutter_validation/constants/routes.dart';
import 'package:http/http.dart' as http;

class LoginService{
  login(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes.login),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    if(response.statusCode==200){
      print(response.body);
    }
  }
}