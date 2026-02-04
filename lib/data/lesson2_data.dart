//Lesson 2 has 8 phrases (just need to record the audio for it)
import '../models/vocab_item.dart';
import '../models/vocab_word.dart';

final List<VocabItem> lesson2Items = [
  VocabItem(
    phrase: 'Ei-hin.', 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase1.mp3', 
    imagePath: 'assets/images/lesson2_phrase1.jpg', 
    translation: "Yes (simple)",
    acceptableTranslations: [
      "yes",
    ],
    words: [
      VocabWord(text: 'Ei-hin', wordAudio: 'assets/audio/MP3/Ei-Hin.mp3', translation: 'yes',
        acceptableTranslations: ['yes']),
    ],
  ),
  VocabItem(
    phrase: 'Hii-hi.', 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase2.mp3', 
    imagePath: 'assets/images/lesson2_phrase2.jpg', 
    translation: "Yes (more emphatic)",
    acceptableTranslations: [
      "yes",
    ],
    words: [
      VocabWord(text: 'Hii-hi', wordAudio: 'assets/audio/MP3/Hii-hi.mp3', translation: 'yes',
        acceptableTranslations: ['yes']),
    ],
  ),
  VocabItem(
    phrase: 'Eyyo.', 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase3.mp3', 
    imagePath: 'assets/images/lesson2_phrase3.jpg', 
    translation: "Yes (older people say this)",
    acceptableTranslations: [
      "yes",
    ],
    words: [
      VocabWord(text: 'Eyyo', wordAudio: 'assets/audio/MP3/Eyyo.mp3', translation: 'yes',
        acceptableTranslations: ['yes']),
    ],
  ),
  VocabItem(
    phrase: "O'o.", 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase4.mp3', 
    imagePath: 'assets/images/lesson2_phrase4.jpg', 
    translation: "No (simple)/Nope",
    acceptableTranslations: [
      "no",
      "nope"
    ],
    words: [
      VocabWord(text: "O'o", wordAudio: 'assets/audio/MP3/O-o.mp3', translation: 'no/nope',
        acceptableTranslations: ['no','nope']),
    ],
  ),
VocabItem(
    phrase: "O'owooye.", 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase5.mp3', 
    imagePath: 'assets/images/lesson2_phrase5.jpg', 
    translation: "No (more emphatic)/Nope",
    acceptableTranslations: [
      "no",
      "nope"
    ],
    words: [
      VocabWord(text: "O'owooye", wordAudio: 'assets/audio/MP3/O-owooye.mp3', translation: 'no/nope',
        acceptableTranslations: ['no','nope']),
    ],
  ),
VocabItem(
    phrase: 'A jaaraama.', 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase6.mp3', 
    imagePath: 'assets/images/lesson2_phrase6.jpg', 
    translation: "Thank you(informal)/Hello",
    acceptableTranslations: [
      "thank you",
      "hello"
    ],
    words: [
      VocabWord(text: 'a', wordAudio: 'assets/audio/MP3/a.mp3', translation: 'you',
        acceptableTranslations: ['you']),
      VocabWord(text: 'jaaraama', wordAudio: 'assets/audio/MP3/jaaraama.mp3', translation: 'greet/thank',
        acceptableTranslations: ['greet','thank']),
    ],
  ),
VocabItem(
    phrase: 'Awa.', 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase7.mp3', 
    imagePath: 'assets/images/lesson2_phrase7.jpg', 
    translation: "Ok",
    acceptableTranslations: [
      "ok",
    ],
    words: [
      VocabWord(text: 'Awa', wordAudio: 'assets/audio/MP3/Awa.mp3', translation: 'Ok',
        acceptableTranslations: ['ok']),
    ],
  ),
VocabItem(
    phrase: 'Accee hakkee.', 
    phraseAudio: 'assets/audio/MP3/Lesson2/lesson2_phrase8.mp3', 
    imagePath: 'assets/images/lesson2_phrase8.jpg', 
    translation: "Please excuse me/Sorry.",
    acceptableTranslations: [
      "excuse me",
      "please excuse me",
      "sorry"
    ],
    words: [
      VocabWord(text: 'Accee', wordAudio: 'assets/audio/MP3/Accee.mp3', translation: '(Plural or formal) Stop/Cease/Allow/Leave (it)',
        acceptableTranslations: ['cease','cease it', 'stop','stop it','allow', 'allow it','leave it']),
      VocabWord(text: 'hakkee', wordAudio: 'assets/audio/MP3/hakkee.mp3', translation: 'resentment',
        acceptableTranslations: ['resentment']),
    ],
  )
];