import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';

class RequestUrlService {
  static String createRequestUrl(String updatedUserInfo, String appId) {
    debugPrint('createRequestUrl()が呼び出されました');
    // JSON文字列をデコードして、DartのMapオブジェクトに変換
    final Map<String, dynamic> userMap = jsonDecode(updatedUserInfo);
    debugPrint('latestUserInfo: $updatedUserInfo');
    debugPrint('userMap: $userMap');
    // HotelListを取得
    final hotelList = userMap['hotellist'] as Map<String, dynamic>;
    debugPrint('HotelList: $hotelList');

    // HotelListから必要な値を取得
    final String checkInDate = hotelList['checkinDate'] ?? '';
    final String checkOutDate = hotelList['checkoutDate'] ?? '';
    final String latitude = hotelList['latitude']?.toString() ?? '';
    final String longitude = hotelList['longitude']?.toString() ?? '';

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
