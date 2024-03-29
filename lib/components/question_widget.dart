import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/quiz_cubit.dart';
import 'package:quiz/cubit/quiz_state.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        final String question =
            state.questions[state.currentQuestionIndex].question;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, height: 1.5),
          ),
        );
      },
    );
  }
}
