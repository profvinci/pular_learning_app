//Answers what lessons exist in this app

import '../models/lesson.dart';
import 'lesson1_data.dart';
import 'lesson2_data.dart';

//add all lessons here

final List<Lesson> allLessons = [
  Lesson(
    title: 'Useful Phrases for Beginners',
    items: lesson1Items
  ),
  Lesson(
      title: 'Polite Words',
      items: lesson2Items
  )
];