//show word, text field, submit button

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/quiz_item.dart';
import 'package:just_audio/just_audio.dart';
import '../models/quiz_question.dart';


class TypingWidget extends StatefulWidget {
  final QuizQuestion question;
  final void Function(bool) onAnswered;   //optional callback to notify quiz detail page

  const TypingWidget ({
    super.key,
    required this.question,
    required this.onAnswered,
  });

  @override
  State<TypingWidget> createState() => _WordTypeState();
}

class _WordTypeState extends State<TypingWidget> {
  late final AudioPlayer wordPlayer;
  final wordController = TextEditingController();

  late final quizItem = widget.question.item;
  late final displayText = quizItem.displayText;

  @override
  void initState() {
    super.initState();
    wordPlayer  = AudioPlayer();
  }

   @override
  void dispose() {
    wordPlayer.dispose();
    wordController.dispose();
    super.dispose();
  }
  //Helper to play individual word audio
  void playWord(QuizItem item) async {
    final path = item.audioPath;
    if (path == null) return;
    try {
      await wordPlayer.setAsset(path);
      wordPlayer.play();
    } catch (e) {
      debugPrint("Error playing word audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Text('Please translate this word: '),
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(quizItem.displayText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.volume_up, size: 30),
                    onPressed: (){
                      playWord(quizItem);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            TextFormField(
              controller: wordController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter the English Translation'
              ),
            ),

            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: (){
                widget.question.submitAnswer(wordController.text);

                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text(widget.question.isCorrect! ? "Correct!" : "Incorrect"),
                    content: Text(widget.question.isCorrect! ? "Great job!"
                      : "The correct answers were: ${quizItem.acceptedAnswers.join(', ')}"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          widget.onAnswered(widget.question.isCorrect ?? false);
                        },        
                        child: const Text("Ok"),
                      )
                    ],
                  ),
                );
              }, 
              child: const Text('Check Answer')),
            
          ],
        ),
      ),
    ); 
  }
}