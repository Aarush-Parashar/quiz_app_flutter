import 'package:flutter/material.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:quiz/screens/question_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var activeScreen = 'questions-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        )),
        child: activeScreen == 'start-screen'
            ? HomeScreen(switchScreen)
            : const QuestionScreen(),
      ),
    );
  }
}
