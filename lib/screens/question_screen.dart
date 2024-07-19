import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return Scaffold(
      backgroundColor: const Color.fromARGB(54, 186, 18, 216),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 45),
            ...currentQuestion.answers.map((answers) {
              return AnswerButton(answers, () {});
            }),
          ],
        ),
      ),
    );
  }
}
