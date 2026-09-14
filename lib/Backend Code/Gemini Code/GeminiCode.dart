import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../Frontend Code/Reusable Widgets/showMessage.dart';
import '../../State Managment/Provider Classes/responseProviderClass.dart';

/// Gemini API key, supplied at build/run time:
/// `flutter run --dart-define=GEMINI_API_KEY=your_key`
const String geminiApiKey = String.fromEnvironment('GEMINI_API_KEY');

const String _geminiModel = 'gemini-1.5-flash-latest';
const Duration _requestTimeout = Duration(seconds: 30);

Future<void> GeminiRequest(BuildContext context, String request) async {
  if (request.trim().isEmpty) {
    Provider.of<ResponseProviderClass>(context, listen: false)
        .UpdateGeminiResponse('', false);
    showMessage(context, 'Nothing Was Heard, Try Again');
    return;
  }

  if (geminiApiKey.isEmpty) {
    Provider.of<ResponseProviderClass>(context, listen: false)
        .UpdateGeminiResponse('', false);
    showMessage(context, 'Missing Gemini API Key');
    return;
  }

  final uri = Uri.https(
    'generativelanguage.googleapis.com',
    '/v1beta/models/$_geminiModel:generateContent',
    {'key': geminiApiKey},
  );

  try {
    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'contents': [
              {
                'parts': [
                  {'text': request}
                ]
              }
            ]
          }),
        )
        .timeout(_requestTimeout);

    if (!context.mounted) return;

    if (response.statusCode != 200) {
      Provider.of<ResponseProviderClass>(context, listen: false)
          .UpdateGeminiResponse('', false);
      showMessage(context, 'Server Is Temporarily Unable To Handle A Request');
      return;
    }

    final String? text = _extractText(response.body);
    if (text == null) {
      Provider.of<ResponseProviderClass>(context, listen: false)
          .UpdateGeminiResponse('', false);
      showMessage(context, 'No Response Generated, Try Again');
      return;
    }

    Provider.of<ResponseProviderClass>(context, listen: false)
        .UpdateGeminiResponse(text.replaceAll(RegExp(r'[*#]'), ''), false);
  } catch (e) {
    if (!context.mounted) return;
    Provider.of<ResponseProviderClass>(context, listen: false)
        .UpdateGeminiResponse('', false);
    showMessage(context, e);
  }
}

/// Returns the generated text, or null when the response carries no candidate
/// (empty result, safety block, unexpected shape).
String? _extractText(String body) {
  try {
    final decoded = jsonDecode(body);
    if (decoded is! Map) return null;

    final candidates = decoded['candidates'];
    if (candidates is! List || candidates.isEmpty) return null;

    final content = candidates.first['content'];
    if (content is! Map) return null;

    final parts = content['parts'];
    if (parts is! List || parts.isEmpty) return null;

    final text = parts.first['text'];
    return text is String && text.isNotEmpty ? text : null;
  } catch (_) {
    return null;
  }
}
