import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/styles/score_screen_text_style.dart';
import 'package:quiz/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question, // Extract question text here
          'correct_answer': questions[i].answers[0],
          'selected_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['selected_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You Answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                    style: ThemeText.scoreHeading,
                  ),
                ),
                const SizedBox(height: 30),
                QuestionsSummary(summaryData: summaryData),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('restart quiz'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
