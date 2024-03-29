import 'package:quiz/cubit/quiz_state.dart';

class QuizRepository {
  List<Question> getQuestions() {
    return [
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
      testQuestion,
    ];
  }
}

const Question testQuestion = Question(
  question: "Which of the following Annimal have the ability to fly?",
  options: [
    Option(text: "Ev", status: QuestionStatus.wrong),
    Option(text: "Anl", status: QuestionStatus.wrong),
    Option(text: "Cal", status: QuestionStatus.wrong),
    Option(text: "Super", status: QuestionStatus.correct),
  ],
);
