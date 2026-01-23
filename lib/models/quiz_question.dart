//data model for quiz questions
import 'quiz_item.dart';

enum QuizQuestionType {
  wordTyping,
  phraseTyping,
  phraseSpeech,
}

class QuizQuestion {
  final String id;
  final QuizQuestionType type;
  final QuizItem item;

  String? userAnswer;
  bool? isCorrect;

  QuizQuestion({
    required this.id,
    required this.type,
    required this.item,
  });

  void submitAnswer(String answer) {
    userAnswer = answer;
    isCorrect = item.validate(answer);
  }

  bool get isAnswered => isCorrect != null;
}