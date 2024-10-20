import 'dart:math';

import 'package:flutter/material.dart';

import 'styled_text.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDice1 = 'assets/images/dice-1.png';
  var activeDice2 = 'assets/images/dice-2.png';
  var activeDice3 = 'assets/images/dice-3.png';
  final randomizer = Random();

  void rollDice() {
    var random1 = randomizer.nextInt(6) + 1;
    var random2 = randomizer.nextInt(6) + 1;
    var random3 = randomizer.nextInt(6) + 1;
    setState(() {
      activeDice1 = 'assets/images/dice-$random1.png';
      activeDice2 = 'assets/images/dice-$random2.png';
      activeDice3 = 'assets/images/dice-$random3.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDice1,
          width: 200,
        ),
        Image.asset(
          activeDice2,
          width: 200,
        ),
        Image.asset(
          activeDice3,
          width: 200,
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.all(20.0),
            foregroundColor: Colors.red,
            textStyle: const TextStyle(fontSize: 30),
          ),
          child: const Text('Roll dice'),
        )
      ],
    );
  }
}
