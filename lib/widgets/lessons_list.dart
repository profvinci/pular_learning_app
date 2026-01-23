//Reusable UI widget

import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonsList extends StatelessWidget{
  final List<Lesson> lessons;
  final Future<void> Function(Lesson lesson) onLessonTap;
  final bool Function(Lesson lesson) isCompleted;

  const LessonsList({
    super.key,
    required this.lessons,
    required this.onLessonTap,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(lessons[index].title),
            trailing: Icon(
              isCompleted(lessons[index]) ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted(lessons[index]) ? Colors.green : Colors.grey),
            onTap: () {
              onLessonTap(lessons[index]);
            },
          ),
        );
      },
    );
  }
}