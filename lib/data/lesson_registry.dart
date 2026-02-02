//Answers what lessons exist in this app

import 'package:flutter_application_1/data/lesson2_data.dart';

import '../models/lesson.dart';
import 'lesson1_data.dart';
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