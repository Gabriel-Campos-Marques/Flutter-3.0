import 'package:flutter/material.dart';

class Cores extends StatelessWidget {
  const Cores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.purple,
              width: 100,
              height: 100,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.orange,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.lightBlueAccent,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.pink,
              width: 100,
              height: 100,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.white,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ],
    );
  }
}

class Teste extends StatelessWidget {
  final Colors cor1;
  final Colors cor2;
  final Colors cor3;

  const Teste(
      {Key? key, required this.cor1, required this.cor2, required this.cor3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
