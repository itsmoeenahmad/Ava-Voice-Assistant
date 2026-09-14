import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextClass {
  static final SpeechToText speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _lastWords = '';

  bool get isAvailable => _speechEnabled;

  bool get isListening => speechToText.isListening;

  /// Initializes the platform recognizer once. Returns false when speech
  /// recognition is unavailable or the microphone permission was denied.
  Future<bool> initSpeech() async {
    if (_speechEnabled) return true;

    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      _speechEnabled = false;
      return false;
    }

    _speechEnabled = await speechToText.initialize();
    return _speechEnabled;
  }

  /// Starts a recognition session. Returns false when the recognizer could not
  /// be started, so the caller can keep its UI in sync.
  Future<bool> startListening() async {
    if (!await initSpeech()) return false;

    _lastWords = '';
    await speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 5),
    );
    return true;
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;
  }

  /// Stops the session and returns everything recognized during it.
  Future<String> stopListening() async {
    if (!_speechEnabled) return '';

    await speechToText.stop();
    final words = _lastWords;
    _lastWords = '';
    return words;
  }
}
