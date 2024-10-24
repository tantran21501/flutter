import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';

import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen ;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      // activeScreen = const QuestionScreen();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    }
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        restartQuiz,
        chosenAnswer: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo,
                Colors.deepPurple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
