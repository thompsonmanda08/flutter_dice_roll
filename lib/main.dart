import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Center(child: Text('Dice Roll')),
          backgroundColor: Colors.purple,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void randomRoll() {
    //This is called a void-callback or an anonymous function
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                child: TextButton(
                    onPressed: () {
                      randomRoll();
                    },
                    child: Image.asset('images/dice$leftDiceNum.png'))),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      randomRoll();
                    },
                    child: Image.asset('images/dice$rightDiceNum.png'))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: TextButton(
            onPressed: () {
              randomRoll();
            },
            child: Container(
              color: Colors.amber,
              height: 60,
              width: 180,
              child: Center(
                child: Text(
                  'Roll Dice',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 24,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
