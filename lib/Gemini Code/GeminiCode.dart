import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../Provider Classes/responseProviderClass.dart';

void GeminiRequest(context, String request) async {
  try {
    String URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyBtwYExM7KETIlfFnLxx0fkqs71VzPOnbg';
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

    print(response.statusCode);
    if (response.statusCode == 200) {
      //Provider.of<GeminiResponseProviderClass>(context, listen: false).changeResponse();
      dynamic result = jsonDecode(response.body.toString());
      String responseIs = result['candidates'][0]['content']['parts'][0]['text'];
      print(responseIs);
      Provider.of<ResponseProviderClass>(context,listen: false).UpdateGeminiResponse(responseIs,false);
    } else {
      print("Failed to get a valid response. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print(e);
  }
}