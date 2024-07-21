import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback startQuiz;

  const HomeScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(148, 255, 255, 255),
            width: 500,
          ),
          const SizedBox(height: 35),
          Text('Learn Flutter the Fun way',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              )),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
