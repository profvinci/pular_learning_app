// Quiz List Page (Screen-Level)

import 'package:flutter/material.dart';
import '../widgets/lessons_list.dart';
import '../models/lesson.dart';
import 'quiz_detail_page.dart';  //Later change to quiz detail page

class QuizPage extends StatelessWidget {
  final List<Lesson> lessons;
  final VoidCallback onQuizUpdated;

  const QuizPage({
    super.key,
    required this.lessons,
    required this.onQuizUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quizzes'), centerTitle: true),
      body: LessonsList(
        lessons: lessons,
        isCompleted: (lesson) => lesson.quizCompleted,
        onLessonTap: (lesson) async{
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizDetailPage(
              lesson: lesson
            ),
            ),
          );

          if (result == true){
            lesson.quizCompleted = true;
            onQuizUpdated();
          }
        },
      ),
    );
  }
}
