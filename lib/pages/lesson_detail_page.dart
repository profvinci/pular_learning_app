//Lesson Detail Screen
//Receive a list of Vocab items and display one flashcard at a time

import 'package:flutter/material.dart';
import '../widgets/flashcard.dart';
import '../models/lesson.dart';

class LessonDetailPage extends StatefulWidget {
  final Lesson lesson;

  const LessonDetailPage({
    super.key,
    required this.lesson,
  });

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  int currentIndex=0;
  bool get isLastCard => currentIndex == widget.lesson.items.length - 1;

  @override
  Widget build(BuildContext context) {
    final item = widget.lesson.items[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: Column(
        children: [
          Expanded(
            child: Flashcard(
              key: ValueKey(item.phrase),
              item: item),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentIndex > 0 ? () {setState(() {currentIndex--;});} : null,
                  child: const Text('Previous'),
                ),
                if (isLastCard)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('Mark Lesson as Complete'),
                      ),
                  ),
                ElevatedButton(
                  onPressed: currentIndex < widget.lesson.items.length - 1 ? () {setState(() {currentIndex++;});} : null, 
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ]
      ), 
    );
  }
}