import 'package:flutter/material.dart';
import 'package:flutter_validation/widgets/my_drawer_header.dart';

class BemVindo extends StatefulWidget {
  const BemVindo({Key? key}) : super(key: key);

  @override
  State<BemVindo> createState() => _BemVindoState();
}

class _BemVindoState extends State<BemVindo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _custonAppBar(),
      drawer: DrawerWidget(),
    );
  }

  _custonAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 90,
      title: Text('Bem Vindo'),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(00),
            ),
            gradient: LinearGradient(
              colors: [Colors.black, Colors.green],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
      ),
    );
  }
}
