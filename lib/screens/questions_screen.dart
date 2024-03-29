import 'package:flutter/material.dart';
import 'package:quiz/components/options_widget.dart';
import 'package:quiz/components/question_widget.dart';
import 'package:quiz/components/questions_status_widget.dart';
import 'package:quiz/components/score_widget.dart';
import 'package:quiz/constants/color_constants.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Container(
          margin:
              const EdgeInsets.only(left: 25, top: 180, right: 25, bottom: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              QuestionsStatusWidget(),
              SizedBox(height: 17),
              ScoreWidget(),
              SizedBox(height: 40),
              QuestionWidget(),
              SizedBox(height: 30),
              OptionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({
    super.key,
    required this.size,
    required this.color,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });
  final double size;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: color,
        ),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const Color left = ColorConstants.leftPartOfBackground;
    const Color right = ColorConstants.rightPartOfBackground;
    final List<Color> gradient = [
      right,
      right,
      left,
      left,
    ];
    const double fillPercent = 50;
    const double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          stops: stops,
          end: Alignment.centerLeft,
          begin: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          BackgroundCircle(
            size: size.width * 0.1,
            color: ColorConstants.circleOnLeftPartOfBackground,
            top: size.height * 0.15,
            left: -size.width * 0.05,
          ),
          BackgroundCircle(
            size: size.width * 0.7,
            color: ColorConstants.circleOnRightPartOfBackground,
            top: size.height * 0.17,
            right: -size.width * 0.2,
          ),
          BackgroundCircle(
            size: size.width * 0.7,
            color: ColorConstants.circleOnLeftPartOfBackground,
            top: size.height * 0.42,
            left: -size.width * 0.4,
          ),
          child,
        ],
      ),
    );
  }
}
