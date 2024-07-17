import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> speak(String text) async {
  final String apiKey = dotenv.env['TEXT_TO_SPEECH_API_KEY']!;
  final String url =
      'https://texttospeech.googleapis.com/v1/text:synthesize?key=$apiKey';
  final AudioPlayer audioPlayer = AudioPlayer();

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'input': {'text': text},
        'voice': {
          'languageCode': 'ja-JP',
          'name': 'ja-JP-Wavenet-B'
        }, //B:女性、C:男性
        'audioConfig': {
          'audioEncoding': 'MP3',
          'pitch': 0.0,
          'speakingRate': 1.3
        },
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final audioContent = base64Decode(responseBody['audioContent']);
      await audioPlayer.play(BytesSource(audioContent));
    } else {
      debugPrint('Error: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
    }
  } catch (e) {
    debugPrint('Error: $e');
  }
}
