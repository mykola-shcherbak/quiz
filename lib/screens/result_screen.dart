import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/constants/text_constants.dart';
import 'package:quiz/cubit/quiz_cubit.dart';
import 'package:quiz/cubit/quiz_state.dart';
import 'package:quiz/screens/questions_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<QuizCubit, QuizState>(
                    builder: (context, state) {
                      final String score =
                          context.read<QuizCubit>().getFinalScoreString();
                      final String scoreString = TextConstants.score + score;
                      return Text(
                        scoreString,
                        style: const TextStyle(fontSize: 20),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<QuizCubit>().resetQuiz();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        TextConstants.tryAgain,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
