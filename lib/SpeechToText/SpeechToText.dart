import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../Backend Code/Gemini Code/GeminiCode.dart';

class SpeechToTextClass {

  static SpeechToText speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';


//This has to happen only once
  void initSpeech() async {
    _speechEnabled = await speechToText.initialize();
    print(_speechEnabled);
  }

// Each time to start a speech recognition session
  void startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
  }

//This is the callback that the SpeechToText plugin calls when
//the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords=result.recognizedWords;
    print('Words are ${_lastWords}');
    print('----------Words Ended----------');
  }

//Stopping the listening
  void stopListening(context) async {
    print('Stopped Listening Called');
    await speechToText.stop();
    print('--------------------Stopped-------------------- & Words Are:  ${_lastWords}');
    GeminiRequest(context, _lastWords);
  }
}
