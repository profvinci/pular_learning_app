// supports full-phrase audio, per-word audio and 
// translation, and an image
import 'vocab_word.dart';
import 'quiz_item.dart';

class VocabItem implements QuizItem{
  final String phrase;        //Full phrase in Pulaar
  final String phraseAudio;   //Path to full phrase audio
  final String imagePath;     //Path to image
  final String translation;   //Full phrase in English
  final List<String> acceptableTranslations; //acceptable answers for quizzes
  final List<VocabWord> words;//Individual words in the phrase

  VocabItem({
    required this.phrase,
    required this.phraseAudio,
    required this.imagePath,
    required this.translation,
    required this.acceptableTranslations,
    required this.words,
  });

  @override
  String get displayText => phrase;

  @override
  List<String> get acceptedAnswers => acceptableTranslations;

  @override
  String? get audioPath => phraseAudio;

  @override
  bool validate(String input) {
    String cleanInput = input.toLowerCase().trim().replaceAll("'", "").replaceAll("’", "").replaceAll(RegExp(r'[^a-z0-9\s]'), '');
    return acceptableTranslations.contains(cleanInput);
  }
}
