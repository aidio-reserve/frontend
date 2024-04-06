import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MessageRepository {
  final String apiEndpoint = 'http://localhost:5001/message';

  Future<void> sendMessage(String message) async {
    final Uri url = Uri.parse('http://localhost:5001/message');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        debugPrint('messageの送信が成功しました');
      } else {
        debugPrint('messageの送信に失敗しました: ${response.body}');
      }
    } catch (e) {
      debugPrint('messageの送信中にエラーが発生しました: $e');
    }
  }
}
