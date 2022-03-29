import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/routes.dart';
import 'package:http/http.dart' as http;

class SingUpService {
  singUp(context,String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes.singUp),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    if(response.statusCode==200){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Cadstrado com sucesso! '),
        ),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email ou senha invalidos! '),
        ),
      );
    }
  }
}
