//Data Model to track lesson progress
import 'vocab_item.dart';

class Lesson {
  final String title;
  final List<VocabItem> items;

  bool lessonCompleted;
  bool quizCompleted;

  Lesson({
    required this.title,
    required this.items,
    this.lessonCompleted = false,
    this.quizCompleted = false,
  });
}