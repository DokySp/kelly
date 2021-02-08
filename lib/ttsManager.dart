import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSManager {
  static FlutterTts flutterTts;
  static dynamic languages;
  static String language;
  static double volume = 0.5;
  static double pitch = 1.0;
  static double rate = 0.5;
  static bool isCurrentLanguageInstalled = false;

  // static TtsState ttsState = TtsState.stopped;

  // static get isPlaying => ttsState == TtsState.playing;
  // static get isStopped => ttsState == TtsState.stopped;
  // static get isPaused => ttsState == TtsState.paused;
  // static get isContinued => ttsState == TtsState.continued;

  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isWeb => kIsWeb;

  // @override
  // initState() {
  //   super.initState();
  //   initTts();
  // }

  static initTts() {
    flutterTts = FlutterTts();

    getLanguages();

    if (isAndroid) {
      getEngines();
    }

    // flutterTts.setStartHandler(() {
    //   print("Playing");
    //   ttsState = TtsState.playing;
    // });

    // flutterTts.setCompletionHandler(() {
    //   print("Complete");
    //   ttsState = TtsState.stopped;
    // });

    // flutterTts.setCancelHandler(() {
    //   print("Cancel");
    //   ttsState = TtsState.stopped;
    // });

    // if (isWeb || isIOS) {
    //   flutterTts.setPauseHandler(() {
    //     print("Paused");
    //     ttsState = TtsState.paused;
    //   });

    //   flutterTts.setContinueHandler(() {
    //     print("Continued");
    //     ttsState = TtsState.continued;
    //   });
    // }

    // flutterTts.setErrorHandler((msg) {
    //   print("error: $msg");
    //   ttsState = TtsState.stopped;
    // });
  }

  static Future getLanguages() async {
    languages = await flutterTts.getLanguages;
    // if (languages != null) setState(() => languages);
  }

  static Future getEngines() async {
    var engines = await flutterTts.getEngines;
    if (engines != null) {
      for (dynamic engine in engines) {
        print(engine);
      }
    }
  }

  static Future speak({@required String input}) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    // print(await flutterTts.getVoices);
    // var sample = (await flutterTts.getVoices).toString();
    // var resultt = "";

    // while (sample.indexOf("ko-") != -1) {
    //   resultt += sample.substring(
    //           sample.indexOf("ko-") - 50, sample.indexOf("ko-") + 120) +
    //       "\n";
    //   sample = sample.substring(sample.indexOf("ko-") + 120);
    // }

    // print(resultt);

    // print(await flutterTts.getLanguages);
    // await flutterTts.setVoice({"name": "Yuna (Enhanced)", "locale": "ko-KR"});
    // Yuna (Enhanced)
    // Sora (Enhanced)
    // iOS Siri 음성을 쓸 수가 없음...

    if (Platform.isIOS) {
      await flutterTts.setVoice({"name": "Yuna", "locale": "ko-KR"});
      await flutterTts.setVoice({"name": "Yuna (Enhanced)", "locale": "ko-KR"});
    }
    if (Platform.isAndroid)
      await flutterTts.setVoice({"name": "ko-KR-language", "locale": "ko-KR"});

    //
    // ko-KR-language
    // ko-kr-x-ism-local
    // ko-kr-x-ism-network
    // ko-kr-x-kob-local
    // ko-kr-x-kob-network
    // ko-kr-x-koc-local
    // ko-kr-x-koc-network
    // ko-kr-x-kod-local
    // ko-kr-x-kod-network

    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(input);
  }

  // static Future stop() async {
  //   var result = await flutterTts.stop();
  //   if (result == 1) ttsState = TtsState.stopped;
  // }

  // static Future pause() async {
  //   var result = await flutterTts.pause();
  //   if (result == 1) ttsState = TtsState.paused;
  // }
}
