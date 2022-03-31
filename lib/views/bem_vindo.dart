import 'package:flutter/material.dart';

class BemVindo extends StatelessWidget {
  const BemVindo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo'),
      ),
      body:  const Center(
        child:  Text('bem vindo'),
      ),
    );
  }
}
