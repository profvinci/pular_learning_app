//Quiz Detail Screen
//Randomly select, display one test question at a time, and maintain quiz state (current question index, score)

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/vocab_item.dart';
import 'package:flutter_application_1/models/vocab_word.dart';
import 'package:flutter_application_1/pages/quiz_results_page.dart';
import '../models/lesson.dart';
import '../widgets/typing.dart';
import '../models/quiz_question.dart';


class QuizDetailPage extends StatefulWidget {
  final Lesson lesson;

  const QuizDetailPage({
    super.key,
    required this.lesson,
  });

  @override
  State<QuizDetailPage> createState() => _QuizDetailPageState();
}

class _QuizDetailPageState extends State<QuizDetailPage> {
  int currentIndex = 0;
  bool get isLastCard => currentIndex == widget.lesson.items.length - 1;
  Map<String, bool> results = {};

  late List <VocabWord> allWords;
  late List <VocabWord> selectedWords;
  late List <VocabItem> allPhrases;
  late List <VocabItem> selectedPhrases;
  late List <VocabItem> transPhrases;
  late List <VocabItem> speakPhrases;
  late List <Widget> wordWidgets;
  late List <QuizQuestion> questions;

  int transCount = 2;
  int speakCount = 3;
  int wordTransCount = 5;
  

  @override
  void initState() {
    super.initState();

    allWords = widget.lesson.items.expand((item) => item.words).toList();
    allPhrases = widget.lesson.items.toList();

    selectedWords = (allWords.toList()..shuffle()).take(wordTransCount).toList();
    selectedPhrases = (allPhrases.toList()..shuffle()).take((transCount+speakCount)).toList();
    transPhrases = selectedPhrases.sublist(0,(transCount));
    speakPhrases = selectedPhrases.sublist((transCount),(transCount+speakCount));

    //master list
    questions = [
      //word typing
      ...selectedWords.map((w) => QuizQuestion(
        id: 'wordTyping_${w.text}',
        type: QuizQuestionType.wordTyping,
        item: w)),

      //phrase typing
      ...transPhrases.map((pt) => QuizQuestion(
        id: 'phraseTyping_${pt.phrase}',
        type: QuizQuestionType.phraseTyping,
        item: pt)),
  //List<Widget> speakPhrase ...
    ];

    //shuffle entire list
    questions.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final focus = questions[currentIndex];
    Widget questionWidget = const SizedBox();
    
    switch (focus.type){
      case QuizQuestionType.wordTyping:
      case QuizQuestionType.phraseTyping:
        questionWidget = TypingWidget(
          key: ValueKey(focus.id),
          question: focus, 
          onAnswered: (bool isCorrect){
            setState(() {
              results[focus.id] = isCorrect;
            });
          },
        );

      case QuizQuestionType.phraseSpeech:
        const SizedBox();
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Aligns children to the end of the row
            children: [
              Padding(
                padding: EdgeInsetsGeometry.directional(start: 16, end: 16, top: 8, bottom: 8),
                child: Text('Question ${currentIndex+1} of ${questions.length}', style: TextStyle(fontSize: 18)),
              )
            ],
          ),

          Expanded(
            child: questionWidget,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isLastCard)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> QuizResultsPage(
                          results: results, 
                          questions: questions,
                          ),
                        ),
                      );
                    },
                    child: const Text('View Results'),
                  ),
  
                ElevatedButton(
                  onPressed: currentIndex < widget.lesson.items.length - 1 ? () {setState(() {currentIndex++;});} : null, 
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}