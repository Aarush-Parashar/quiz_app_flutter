import 'package:flutter/material.dart';
import 'package:quiz/styles/score_screen_text_style.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: ThemeText.styleText,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          style: ThemeText.styleText,
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['selected_answer'] as String,
                          style: ThemeText.styleText,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: ThemeText.styleText,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
