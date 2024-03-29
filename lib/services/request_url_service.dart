//米田のAPIから帰ってきたhotel infoから必要なデータを切り取って、リクエストURLを作成するコード

import 'dart:core';

import 'package:flutter/material.dart';

class RequestUrlService {
  static String createRequestUrl(String userInput, String appId) {
    debugPrint('User input: $userInput');
    // ユーザー入力から必要な情報を抽出する正規表現パターン
    final checkInDatePattern = RegExp(r"'checkinDate': '([0-9\-]+)'");
    final checkOutDatePattern = RegExp(r"'checkoutDate': '([0-9\-]+)'");
    final latitudePattern = RegExp(r"'latitude': ([0-9\.]+)");
    final longitudePattern = RegExp(r"'longitude': ([0-9\.]+)");

    // パターンにマッチする部分をユーザー入力から探し、値を抽出
    final checkInDateMatch = checkInDatePattern.firstMatch(userInput);
    final checkOutDateMatch = checkOutDatePattern.firstMatch(userInput);
    final latitudeMatch = latitudePattern.firstMatch(userInput);
    final longitudeMatch = longitudePattern.firstMatch(userInput);

    // 抽出した値を変数に代入
    final checkInDate = checkInDateMatch?.group(1) ?? '';
    final checkOutDate = checkOutDateMatch?.group(1) ?? '';
    final latitude = latitudeMatch?.group(1) ?? '';
    final longitude = longitudeMatch?.group(1) ?? '';

    // リクエストURLの構築
    final requestUrl =
        'https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426'
        '?format=json'
        '&checkinDate=$checkInDate'
        '&checkoutDate=$checkOutDate'
        '&latitude=$latitude'
        '&longitude=$longitude'
        '&searchRadius=2'
        '&datumType=1'
        '&applicationId=$appId';

    return requestUrl;
  }
}
