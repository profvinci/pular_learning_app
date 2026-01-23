// Lesson List Page (Screen-Level)

import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../widgets/lessons_list.dart';
import 'lesson_detail_page.dart';

class LessonsPage extends StatelessWidget {
  final List<Lesson> lessons;
  final VoidCallback onLessonsUpdated;

  const LessonsPage({
    super.key,
    required this.lessons,
    required this.onLessonsUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lessons'), centerTitle: true),
      body: LessonsList(
        lessons: lessons,
        isCompleted: (lesson) => lesson.lessonCompleted,
        onLessonTap: (lesson) async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LessonDetailPage(
              lesson: lesson,
              ),
            ),
          );

          if (result == true){
            lesson.lessonCompleted = true;
            onLessonsUpdated();
          }
        }
      ),
    );
  }
}

              