import 'package:flutter/material.dart';
import 'package:quiz/constants/color_constants.dart';
import 'package:quiz/cubit/quiz_state.dart';

Color getStatusColor(Option? selectedOption) {
  if (selectedOption == null) {
    return Colors.grey;
  } else if (selectedOption.status == QuestionStatus.correct) {
    return ColorConstants.green;
  } else {
    return ColorConstants.wrongOptionStatusBar;
  }
}

Color getButtonBackgroundColor(Option? option, Option? selectedOption) {
  if (selectedOption == null) {
    return Colors.white;
  } else if (option?.status == QuestionStatus.correct) {
    return ColorConstants.green;
  } else if (option?.status == QuestionStatus.wrong &&
      selectedOption == option) {
    return ColorConstants.wrongOptionBackground;
  } else {
    return Colors.white;
  }
}

Color getButtonTextColor(Option? option, Option? selectedOption) {
  if (option?.status == QuestionStatus.wrong && selectedOption == option) {
    return ColorConstants.wrongOptionText;
  } else {
    return Colors.black;
  }
}
