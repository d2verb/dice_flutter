import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              child: Image(image: AssetImage('images/dice$leftDiceNumber.png')),
              onPressed: () {
                changeDiceFace();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
                splashFactory: NoSplash.splashFactory,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              child:
                  Image(image: AssetImage('images/dice$rightDiceNumber.png')),
              onPressed: () {
                changeDiceFace();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
                splashFactory: NoSplash.splashFactory,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
