import 'package:flutter/material.dart';
import 'package:quiz/styles/score_screen_text_style.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust based on your requirement
        childAspectRatio: 3, // Adjust based on your requirement
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: summaryData.length,
      itemBuilder: (ctx, index) {
        final data = summaryData[index];
        final isCorrect = data['selected_answer'] == data['correct_answer'];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: isCorrect ? Colors.green : Colors.red,
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: ThemeText.styleText,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Your Answer: ${data['selected_answer']}',
                      style: ThemeText.styleText.copyWith(
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    Text(
                      'Correct Answer: ${data['correct_answer']}',
                      style: ThemeText.styleText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
