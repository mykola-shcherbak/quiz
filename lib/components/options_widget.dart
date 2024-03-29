import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/components/option_widget.dart';
import 'package:quiz/cubit/quiz_cubit.dart';
import 'package:quiz/cubit/quiz_state.dart';
import 'package:quiz/utils/option_status_utils.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        final Question question = state.questions[state.currentQuestionIndex];
        final bool isBlocked = state.isBlocked;
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0),
            itemCount: question.options.length,
            itemBuilder: (context, index) {
              final Option option = question.options[index];

              final Color backgroundColor =
                  getButtonBackgroundColor(option, question.selectedOption);
              final Color textColor =
                  getButtonTextColor(option, question.selectedOption);
              return OptionWidget(
                option: option,
                backgroundColor: backgroundColor,
                textColor: textColor,
                isBlocked: isBlocked,
              );
            },
          ),
        );
      },
    );
  }
}
