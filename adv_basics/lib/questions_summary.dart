import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                verticalDirection: VerticalDirection.up,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        data['user_answer'] == data['correct_answer']
                            ? Colors.blue
                            : Colors.red,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
