//data model for each word in a phrase

import 'quiz_item.dart';

class VocabWord implements QuizItem {
  final String text;
  final String wordAudio;
  final String translation;
  final List<String> acceptableTranslations;

  VocabWord({
    required this.text,
    required this.wordAudio,
    required this.translation,
    required this.acceptableTranslations,
  });

  @override
  String get displayText => text;

  @override
  String get displayTrans => translation;

  @override
  List<String> get acceptedAnswers => acceptableTranslations;

  @override
  String? get audioPath => wordAudio;

  //Validation Logic
  @override
  bool validate(String input) {
    String cleanInput = input.toLowerCase().trim().replaceAll("'", "").replaceAll("’", "").replaceAll(RegExp(r'[^a-z0-9\s]'), '');
    return acceptableTranslations.contains(cleanInput);
  }
}