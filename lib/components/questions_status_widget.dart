import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/quiz_cubit.dart';
import 'package:quiz/cubit/quiz_state.dart';
import 'package:quiz/utils/question_status_utils.dart';

class QuestionsStatusWidget extends StatelessWidget {
  const QuestionsStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 14;

    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        final List<Question> questions = state.questions;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: questions
              .map(
                (question) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                      color: getStatusColor(question.selectedOption),
                      borderRadius: BorderRadius.circular(size / 2)),
                  height: size,
                  width: size,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
