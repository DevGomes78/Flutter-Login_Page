import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/routes_api.dart';
import 'package:flutter_validation/views/bem_vindo.dart';
import 'package:flutter_validation/views/cadastro.dart';
import 'package:flutter_validation/views/login_page.dart';
import 'package:flutter_validation/views/splash.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.light),
      home: const Splash(),
      routes: {
        Routes.bemVindo: (context) => BemVindo(),
        Routes.cadastro: (context) => Cadastro(),
        Routes.loginPage: (context) => Login(),
      },
    );
  }
}
