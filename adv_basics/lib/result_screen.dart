import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.restartQuiz, {
    super.key,
    required this.chosenAnswer,
  });
  final void Function() restartQuiz;
  final List<String> chosenAnswer;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0], // first element always true
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly !'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            IconButton(
              icon: const Icon(
                Icons.replay_outlined,
              ),
              onPressed: restartQuiz,
              // child: const Text('Restart Quizz !'),
            )
          ],
        ),
      ),
    );
  }
}
