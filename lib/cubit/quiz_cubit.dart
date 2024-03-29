import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/quiz_state.dart';
import 'package:quiz/repository/quiz_repository.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(InitialQuizState()) {
    getQuestions();
  }

  final QuizRepository quizRepository = QuizRepository();

  void getQuestions() {
    final List<Question> questions = quizRepository.getQuestions();
    emit(state.copyWith(questions: questions));
  }

  void selectOption(Option option) {
    emit(state.copyWith(isBlocked: true));
    final List<Question> questions = [...state.questions];
    final int currentQuestionIndex = state.currentQuestionIndex;
    Question solvedQuestion =
        questions[currentQuestionIndex].copyWith(selectedOption: option);
    questions[currentQuestionIndex] = solvedQuestion;
    emit(state.copyWith(questions: questions));

    sumCorrectAnswers(option.status);
  }

  void goToNextQuestion(VoidCallback callback) async {
    final int currentQuestionIndex = state.currentQuestionIndex;
    await Future.delayed(const Duration(milliseconds: 1000));
    if (currentQuestionIndex < state.questions.length - 1) {
      emit(state.copyWith(
          currentQuestionIndex: currentQuestionIndex + 1, isBlocked: false));
    } else {
      callback();
    }
  }

  void sumCorrectAnswers(OptionStatus status) async {
    if (status == OptionStatus.correct) {
      emit(state.copyWith(correctAnswers: state.correctAnswers + 1));
    }
  }

  int getScore() {
    return state.correctAnswers * QuizState.pointsPerQuestion;
  }

  String getFinalScoreString() {
    return "${state.correctAnswers * QuizState.pointsPerQuestion}/${state.questions.length * QuizState.pointsPerQuestion}";
  }

  void resetQuiz() {
    emit(InitialQuizState());
    getQuestions();
  }
}
