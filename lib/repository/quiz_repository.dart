import 'package:quiz/cubit/quiz_state.dart';

class QuizRepository {
  List<Question> getQuestions() {
    return questions;
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

const Question testQuestion2 = Question(
  question: "Where would you be if you were standing on the Spanish Steps?",
  options: [
    Option(text: "China", status: QuestionStatus.wrong),
    Option(text: "Rome", status: QuestionStatus.wrong),
    Option(text: "Hong Kong", status: QuestionStatus.correct),
    Option(text: "England", status: QuestionStatus.wrong),
  ],
);

List<Question> questions = [
  testQuestion,
  testQuestion2,
  testQuestion,
  testQuestion2,
  testQuestion,
  testQuestion2,
  testQuestion,
  testQuestion2,
  testQuestion,
  testQuestion2,
];
