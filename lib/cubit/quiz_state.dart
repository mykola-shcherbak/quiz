class QuizState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final int correctAnswers;
  final bool isBlocked;

  static const int pointsPerQuestion = 10;

  const QuizState({
    required this.questions,
    required this.currentQuestionIndex,
    required this.correctAnswers,
    required this.isBlocked,
  });

  QuizState copyWith({
    List<Question>? questions,
    int? currentQuestionIndex,
    int? correctAnswers,
    bool? isBlocked,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }
}

class InitialQuizState extends QuizState {
  InitialQuizState()
      : super(
          questions: [],
          currentQuestionIndex: 0,
          correctAnswers: 0,
          isBlocked: false,
        );
}

class Option {
  final String text;
  final OptionStatus status;
  const Option({
    required this.text,
    required this.status,
  });
}

class Question {
  final String question;
  final List<Option> options;
  final Option? selectedOption;

  const Question(
      {required this.question, required this.options, this.selectedOption});

  Question copyWith({
    String? question,
    List<Option>? options,
    Option? selectedOption,
  }) {
    return Question(
      question: question ?? this.question,
      options: options ?? this.options,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}

enum OptionStatus { wrong, correct }
