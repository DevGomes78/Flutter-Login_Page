import 'package:flutter/material.dart';
import 'package:flutter_validation/pages/bem_vindo.dart';
import 'package:flutter_validation/pages/register_page.dart';
import 'package:flutter_validation/pages/login_page.dart';
import 'package:flutter_validation/pages/splash_page.dart';
import 'package:flutter_validation/routes/routes.dart';

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
      //  RoutesPage.bemVindo: (context) => BemVindo(),
        RoutesPage.cadastro: (context) => RegisterPage(),
        RoutesPage.loginPage: (context) => Login(),
      },
    );
  }
}
