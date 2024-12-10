import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:voiceassistant/Reusable%20Widgets/showMessage.dart';
import '../Provider Classes/responseProviderClass.dart';

void GeminiRequest(context, String request) async {
  print('-----------Gemini Request Called----------- & Input is: ${request}');
  try {
    print('In Gemini Request');
    String URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyDKlSB5bzhDfc0G9UUHhA2apfLMnWBTUAk';
    final headers = {'Content-Type': 'application/json'};
    dynamic body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": request}
          ]
        }
      ]
    });

    final response = await http.post(Uri.parse(URL), headers: headers, body: body);
    print('Response Status Code is ${response.statusCode}');
    print(response.body.toString());
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body.toString());
      String responseIs = result['candidates'][0]['content']['parts'][0]['text'];
      print(responseIs);
      String cleanedResponse = responseIs.replaceAll(RegExp(r'[*#]'), '');
      print(cleanedResponse);
      Provider.of<ResponseProviderClass>(context,listen: false).UpdateGeminiResponse(cleanedResponse,false);
    } else {
      showMessage(context, 'Server Is Temporarily Unable To Handle A Request');
      print("Failed to get a valid response. Status code: ${response.statusCode}");
      //Back To Main - Home Screen

    }
  } catch (e) {
    print(e);
    showMessage(context, e);
  }
}