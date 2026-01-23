//render 1 vocab item
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/vocab_item.dart';
import '../models/vocab_word.dart';

class Flashcard extends StatefulWidget {
  final VocabItem item;

  const Flashcard({
    super.key,
    required this.item,
  });

  @override
  State<Flashcard> createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  VocabWord? selectedWord;                        //Tracks which word was tapped
  bool showFullTranslation = false;

  //Audio Players
  late final AudioPlayer fullPhrasePlayer;
  late final AudioPlayer wordPlayer;

  Offset? bubblePosition;

  @override
  void initState() {
    super.initState();
    fullPhrasePlayer = AudioPlayer();
    wordPlayer  = AudioPlayer();
  }

  @override
  void dispose() {
    fullPhrasePlayer.dispose();
    wordPlayer.dispose();
    super.dispose();
  }

  //Helper to play full phrase audio
  void playFullPhrase() async {
    try {
      await fullPhrasePlayer.setAsset(widget.item.phraseAudio);
      fullPhrasePlayer.play();
    } catch (e) {
      debugPrint("Error playing full phrase audio: $e");
    }
  }

  //Helper to play individual word audio
  void playWord(VocabWord word) async {
    try {
      await wordPlayer.setAsset(word.wordAudio);
      wordPlayer.play();
    } catch (e) {
      debugPrint("Error playing word audio: $e");
    }
  }

  //Hide bubble when tapping outside words
  void hideBubble() {
    setState(() {
      selectedWord = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideBubble,
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Full phrase words will be tappable
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.item.words.map((word) {
                      return GestureDetector(
                        onTapDown: (details) {
                          setState(() {
                            selectedWord = word;
                            bubblePosition = details.globalPosition;
                          });
                          playWord(word);
                        },
                        child: Text(
                          word.text,
                          style: TextStyle(
                            fontSize: 20,
                            color: selectedWord == word ? Colors.blue : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList()
                  ),

                  const SizedBox(height: 8),

                  //Placeholder for full phrase audio
                  IconButton(
                    icon: const Icon(Icons.volume_up, size: 30),
                    onPressed: playFullPhrase,
                  ),

                  const SizedBox(height: 16),

                  //Placeholder for image
                  Image.asset(
                    widget.item.imagePath,
                    height:150,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 16),

                  //Placeholder for full phrase translation (initially hidden)
                  if (showFullTranslation)
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey[200],
                      alignment: Alignment.center,
                      child: Text(
                        widget.item.translation,
                        style: const TextStyle(fontSize: 16)
                      ),
                    ),
                          
                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showFullTranslation = !showFullTranslation;
                      });
                    },
                    child: Text(showFullTranslation ? 'Hide Translation' : 'Reveal Translation'),
                  ),
                ],
              ),

              //Word bubble floating above everything
              if (selectedWord != null && bubblePosition != null)
                Positioned(
                  left: bubblePosition!.dx - 40, //approx center
                  top: bubblePosition!.dy - 80, //float above UI
                  child: Material(
                    elevation: 4,
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        selectedWord!.translation,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ),
                ),
            ] 
          ),
        ),
      ),
    );
  }
}