import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/routes_api.dart';
import 'package:http/http.dart' as http;

class SingUpService {
  singUp(context,String name ,String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes.singUp),
      body: jsonEncode(
        {
          'name': name,
          'email': email,
          'password': password,
        },
      ),
    );
    if(response.statusCode==200){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Cadastrado com sucesso! '),
        ),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email ou senha invalidos! '),
        ),
      );
    }
  }
}
