//show phrase, mic button, feedback

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/quiz_item.dart';
import 'package:just_audio/just_audio.dart';
import '../models/quiz_question.dart';
import 'package:record/record.dart';

class SpeakingWidget extends StatefulWidget {
  final QuizQuestion question;
  final void Function(bool) onAnswered;

  const SpeakingWidget({
    super.key,
    required this.question,
    required this.onAnswered,
  });

  @override
  State<SpeakingWidget> createState() => _SpeakingWidgetState();
}

class _SpeakingWidgetState extends State<SpeakingWidget> {
  late final AudioPlayer audioPlayer;
  late final AudioRecorder audioRecorder;

  late final QuizItem quizItem = widget.question.item;
  late final displayText = quizItem.displayText;

  bool isRecording = false;
  bool hasAttempted = false;
  bool showReferenceAudio = false;
  String? path;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioRecorder = AudioRecorder();
  }


  @override
  void dispose() {
    audioPlayer.dispose();
    audioRecorder.dispose();
    super.dispose();
  }

  // Play reference audio from assets
  void playReferenceAudio() async {
    final path = quizItem.audioPath;
    if (path == null) return;
    try {
      await audioPlayer.setAsset(path);
      audioPlayer.play();
    } catch (e) {
      debugPrint("Error playing reference audio: $e");
    }
  }

  // Start recording user audio
  Future<void> startRecording() async {
    if (!await audioRecorder.hasPermission()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Microphone permission is required to record.'),
        ),
      );
      return;
    }

    await audioRecorder.start(
      const RecordConfig(
        encoder: AudioEncoder.wav,
      ), 
      path: 'speaking.wav',
    ); 
    
    setState(() {
      isRecording = true;
    });
  }

  // Stop recording
  Future<void> stopRecording() async {
    path = await audioRecorder.stop();
    print('Recording stored at: $path');
    setState(() {
      isRecording = false;
      hasAttempted = true;
      showReferenceAudio = true;
    });
  }

  // Play the user recording
  Future<void> playUserAudio() async {
    if (path == null) return;

    try {
      await audioPlayer.setUrl(path!);
      audioPlayer.play();
    } catch (e) {
      debugPrint('Error playing user audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const Text('Please say this in Pulaar:'),
            const SizedBox(height: 12),
            Center(
              child: Text(
                quizItem.displayTrans,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!showReferenceAudio)
                  IconButton(
                    icon: Icon(
                      isRecording ? Icons.stop_circle : Icons.mic_rounded,
                      size: 160,
                      color: isRecording ? Colors.red : null,
                    ),
                    onPressed: () {
                      if (isRecording) {
                        stopRecording();
                      } else {
                        startRecording();
                      }
                    },
                  ),
                if (showReferenceAudio)
                  IconButton(
                    icon: const Icon(Icons.hearing_rounded, size: 100),
                    onPressed: playUserAudio,
                  ),
                if (showReferenceAudio)
                  IconButton(
                    icon: const Icon(Icons.volume_up_rounded, size: 100),
                    onPressed: playReferenceAudio,
                  ),
              ],
            ),
            const SizedBox(height: 24),
            if (showReferenceAudio)
              Center(
                child: Text(
                  quizItem.displayText,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 24),
            if (hasAttempted)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.onAnswered(true);
                    },
                    child: const Text('I got it!'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasAttempted = false;
                        showReferenceAudio = false;
                        path = null;
                      });
                    },
                    child: const Text('Try again!'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onAnswered(false);
                    },
                    child: const Text('SKIP'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
