import 'package:quiz/cubit/quiz_state.dart';

class QuizRepository {
  List<Question> getQuestions() {
    return questions;
  }
}

const Question testQuestion = Question(
  question: "Which of the following Annimal have the ability to fly?",
  options: [
    Option(text: "Ev", status: OptionStatus.wrong),
    Option(text: "Anl", status: OptionStatus.wrong),
    Option(text: "Cal", status: OptionStatus.wrong),
    Option(text: "Super", status: OptionStatus.correct),
  ],
);

const Question testQuestion2 = Question(
  question: "Where would you be if you were standing on the Spanish Steps?",
  options: [
    Option(text: "China", status: OptionStatus.wrong),
    Option(text: "Rome", status: OptionStatus.wrong),
    Option(text: "Hong Kong", status: OptionStatus.correct),
    Option(text: "England", status: OptionStatus.wrong),
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
