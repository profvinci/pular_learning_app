abstract class QuizItem {
  String get displayText;
  List<String> get acceptedAnswers;
  bool validate(String input);

  String? get audioPath => null;
}