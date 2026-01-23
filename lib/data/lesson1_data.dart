//Lesson 1 has 5 phrases
import '../models/vocab_item.dart';
import '../models/vocab_word.dart';

final List<VocabItem> lesson1Items = [
  VocabItem(
    phrase: 'Pular an-on lannii!', 
    phraseAudio: 'audio/MP3/Lesson1/lesson1_phrase1.mp3', 
    imagePath: 'images/lesson1_phrase1.jpg', 
    translation: "That's all the Pular I know!",
    acceptableTranslations: [
      "my pular is finished",
      "thats all the pular i know",
      "my pular is done",
    ],
    words: [
      VocabWord(text: 'Pular', wordAudio: 'audio/MP3/Pular.mp3', translation: 'Pular',
        acceptableTranslations: ['pular']),
      VocabWord(text: 'an-on', wordAudio: 'audio/MP3/An-On.mp3', translation: 'my',
        acceptableTranslations: ['my']),
      VocabWord(text: 'lannii', wordAudio: 'audio/MP3/Lanni.mp3', translation: 'finished',
        acceptableTranslations: ['finished', 'ended', 'done']),
    ],
  ),
  VocabItem(
    phrase: 'Mi waawataa Pular buy.', 
    phraseAudio: 'audio/MP3/Lesson1/lesson1_phrase2.mp3',
    imagePath: 'images/lesson1_phrase2.jpg',
    translation: "I can't speak alot of Pular.",
    acceptableTranslations: [
      "i cant speak alot of pular", "i cannot speak alot of Pular", "i can not speak alot of Pular",
      "i cant speak a lot of pular", "i cannot speak a lot of Pular", "i can not speak a lot of Pular",
      "i cant speak Pular alot", "i cannot speak Pular alot", "i can not speak Pular alot",
      "i cant speak Pular a lot", "i cannot speak Pular a lot", "i can not speak Pular a lot"
    ],
    words: [
      VocabWord(text: 'Mi', wordAudio: 'audio/MP3/Mi.mp3', translation: 'I',
        acceptableTranslations: ['i']),
      VocabWord(text: 'waawataa', wordAudio: 'audio/MP3/Waawataa.mp3', translation: "can't",
        acceptableTranslations: ['cant', 'cannot', 'can not', 'am not able to']),
      VocabWord(text: 'Pular', wordAudio: 'audio/MP3/Pular.mp3', translation: 'Pular',
        acceptableTranslations: ['pular']),
      VocabWord(text: 'buy', wordAudio: 'audio/MP3/Buy.mp3', translation: 'alot/many',
        acceptableTranslations: ['alot','a lot','many']),
    ],
  ),
  VocabItem(
    phrase: 'Mi lan waawi Pular seeda tun.', 
    phraseAudio: 'audio/MP3/Lesson1/lesson1_phrase3.mp3', 
    imagePath: 'images/lesson1_phrase3.jpg', 
    translation: 'I can only speak a little Pular.',
    acceptableTranslations: [
      "i can only speak a little pular",
      "i can speak a little pular only",
      "i am able to speak a little pular only",
      "i am able to only speak a little pular"
    ],
    words: [
      VocabWord(text: 'Mi lan', wordAudio: 'audio/MP3/Mi-Lan.mp3', translation: 'I am (action)',
        acceptableTranslations: ['i am','im']),
      VocabWord(text: 'waawi', wordAudio: 'audio/MP3/Waawi.mp3', translation: 'can/able',
        acceptableTranslations: ['can','am able to']),
      VocabWord(text: 'Pular', wordAudio: 'audio/MP3/Pular.mp3', translation: 'Pular',
        acceptableTranslations: ['pular']),
      VocabWord(text: 'seeda', wordAudio: 'audio/MP3/Seeda.mp3', translation: 'a little',
        acceptableTranslations: ['a little','alittle']),
      VocabWord(text: 'tun', wordAudio: 'audio/MP3/Tun.mp3', translation: 'only',
        acceptableTranslations: ['only']),
    ],
  ),
  VocabItem(
    phrase: 'Mi faamaali.',
    phraseAudio: 'audio/MP3/Lesson1/lesson1_phrase4.mp3',
    imagePath: 'images/lesson1_phrase4.jpg',
    translation: "I didn't understand.",
    acceptableTranslations: [
      'i didnt understand',
    ],
    words: [
    VocabWord(text: 'Mi', wordAudio: 'audio/MP3/Mi.mp3', translation: 'I', acceptableTranslations: ["i"]),
    VocabWord(text: 'faamaali', wordAudio: 'audio/MP3/Faamaali.mp3', translation: "didn't understand",
      acceptableTranslations: ['didnt understand']),
    ],
  ),
  VocabItem(
    phrase: 'Mi lan ekitaade.',
    phraseAudio: 'audio/MP3/Lesson1/lesson1_phrase5.mp3',
    imagePath: 'images/lesson1_phrase5.jpg',
    translation: 'I am learning.',
    acceptableTranslations: [
      "i am learning",
      "i am practicing",
    ],
    words: [
      VocabWord(text: 'Mi lan', wordAudio: 'audio/MP3/Mi-Lan.mp3', translation: 'I am (action)',
        acceptableTranslations: ['i am','im']),
      VocabWord(text: 'ekitaade', wordAudio: 'audio/MP3/Ekitaade.mp3', translation: 'learning/practicing',
        acceptableTranslations: ['learning','practicing']),
    ]
  ),
];