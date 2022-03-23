import 'package:flutter/material.dart';
import 'package:flutter_validation/views/home_page.dart';
import 'package:flutter_validation/views/splash.dart';

void main() {
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
    );
  }
}
