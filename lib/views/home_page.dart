import 'package:flutter/material.dart';
import 'package:flutter_validation/views/view_validation.dart';

class  HomePage extends StatelessWidget {
  const  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Validação de Campos'),
        centerTitle:  true,
      ),
      body: Validation(),
    );
  }
}
