import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/service_constants/service_constants.dart';

class RegisterLoginService {
  singUp(context, String name, String lastname, String email,
      String password) async {
    http.Response response = await http.post(
      Uri.parse(ServiceConstants.singUp),
      body: jsonEncode(
        {
          'name': name,
          'lastName': lastname,
          'email': email,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Cadastrado com sucesso!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao cadastrar! '),
        ),
      );
    }
  }
}
