import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DiceApp(),
      ),
    ),
  );
}

class DiceApp extends StatefulWidget {
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDiceNumber = new Random().nextInt(6) + 1;

  int rightDiceNumber = new Random().nextInt(6) + 1;

  String message = "";
  @override
  Widget build(BuildContext context) {
    void randLeft(int pre) {
      setState(() {
        leftDiceNumber = new Random().nextInt(6) + 1;
        if (leftDiceNumber == pre) {
          randLeft(leftDiceNumber);
        }
      });

      //leftDiceNumber = randomNumber;
    }

    void randRight(int pre) {
      setState(() {
        rightDiceNumber = new Random().nextInt(6) + 1;
        if (rightDiceNumber == pre) {
          randRight(rightDiceNumber);
        }
      });
      //rightDiceNumber = randomNumber;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    randLeft(leftDiceNumber);
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    randRight(rightDiceNumber);
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          TextButton(
            child: Text(
              'Click',
            ),
            onPressed: () {
              randLeft(leftDiceNumber);
              randRight(rightDiceNumber);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.red,
              minimumSize: const Size(100, 25),
              backgroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
