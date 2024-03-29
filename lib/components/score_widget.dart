import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/constants/color_constants.dart';
import 'package:quiz/constants/text_constants.dart';
import 'package:quiz/cubit/quiz_cubit.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String score = context.watch<QuizCubit>().getScore().toString();
    const double size = 125;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: ColorConstants.purple,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            score,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 36,
              height: 1.1,
            ),
          ),
          Text(
            TextConstants.point.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
