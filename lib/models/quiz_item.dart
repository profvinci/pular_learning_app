abstract class QuizItem {
  String get displayText;
  String get displayTrans;
  List<String> get acceptedAnswers;
  bool validate(String input);

  String? get audioPath => null;
}