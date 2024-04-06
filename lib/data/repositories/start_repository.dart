import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StartRepository {
  final String apiEndpoint = 'http://localhost:5001/start';
  final http.Client httpClient;

  StartRepository() : httpClient = http.Client();

  Future<void> accessToStart(String threadId) async {
    final Uri url = Uri.parse('http://localhost:5001/start');

    try {
      final response = await httpClient.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'threadId': threadId,
        }),
      );

      if (response.statusCode == 200) {
        debugPrint('/startが呼び出されました');
      } else {
        debugPrint('/startの呼び出しに失敗しました: ${response.body}');
      }
    } catch (e) {
      debugPrint('/startの呼び出し中にエラーが発生しました: $e');
    }
  }
}