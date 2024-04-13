import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExportUserInfoRepository {
  final String apiEndpoint = 'http://localhost:5001/export_userinfo';
  final http.Client httpClient;
  final Ref ref;

  ExportUserInfoRepository({required this.ref}) : httpClient = http.Client();

  Map<String, dynamic> userInfoMap = {};

  Future<void> sendUserInfoRequest(String threadId) async {
    final Uri url = Uri.parse('http://localhost:5001/export_userinfo');

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
        Map<String, dynamic> responseData = jsonDecode(response.body);
        userInfoMap[threadId] ??= [];
        userInfoMap[threadId].add(responseData);
        debugPrint('exportUserInfoの取得に成功しました');
        debugPrint('UserInfo: $responseData');
      } else {
        debugPrint('exportUserInfoの取得に失敗しました: ${response.body}');
      }
    } catch (e) {
      debugPrint('exportUserInfoの取得中にエラーが発生しました: $e');
    }
  }
}
