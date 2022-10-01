import 'package:flutter/material.dart';


import 'home_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
                colors: [(Colors.green), (Colors.black)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Center(
          child: Container(
            height: 150,
            child: Image.asset('images/frog.png'),
          ),
        ),
      ],
    ));
  }
}
