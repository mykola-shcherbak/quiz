import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/quiz_cubit.dart';
import 'package:quiz/screens/questions_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => QuizCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionsScreen(),
    );
  }
}
