import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/quiz_cubit.dart';
import 'package:quiz/cubit/quiz_state.dart';
import 'package:quiz/screens/result_screen.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.option,
    required this.backgroundColor,
    required this.textColor,
    required this.isBlocked,
  });

  final Option option;
  final Color backgroundColor;
  final Color textColor;
  final bool isBlocked;

  @override
  Widget build(BuildContext context) {
    final QuizCubit quizCubit = context.read<QuizCubit>();
    void callback() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ResultScreen()));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      child: ElevatedButton(
          onPressed: () {
            if (!isBlocked) {
              quizCubit.selectOption(option);
              quizCubit.goToNextQuestion(callback);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              side: const BorderSide(color: Colors.black, width: 0.5),
              fixedSize: const Size(double.infinity, 50)),
          child: Text(
            option.text,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
          )),
    );
  }
}
