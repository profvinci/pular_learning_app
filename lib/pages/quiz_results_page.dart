//need to update so that it will return that the quiz was finished on quiz page

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/quiz_question.dart';

class QuizResultsPage extends StatelessWidget{
  final Map<String, bool> results;
  final List<QuizQuestion> questions;

  const QuizResultsPage({
    super.key,
    required this.results,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    int score = results.values.where((v) => v == true).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Summary', style:TextStyle(fontSize: 24),textAlign: TextAlign.center)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Your Score: ${((score/questions.length)*100).round()}% - $score / ${questions.length}', 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final q = questions[index];
                final isCorrect = results[q.id] ?? false; //

                return ListTile(
                  leading: Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                  title: Text(q.item.displayText),
                  subtitle: Text('Correct answer: ${q.item.acceptedAnswers.join(", ")}'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, true);
            } ,
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }
}