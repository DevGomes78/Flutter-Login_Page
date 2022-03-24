import 'package:flutter/material.dart';
class ContainerWidget extends StatelessWidget {
  String? text;
  ContainerWidget({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
        ),
        color: Colors.green,
        gradient: LinearGradient(
            colors: [(Colors.green), (Colors.black)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('images/frog.png'),
              height: 150,
              width: 180,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
