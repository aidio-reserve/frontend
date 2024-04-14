import 'dart:convert';
import 'dart:core';

class RequestUrlService {
  static String createRequestUrl(String updatedUserInfo, String appId) {
    final Map<String, dynamic> userMap = jsonDecode(updatedUserInfo);
    final hotelList = userMap['hotellist'] as Map<String, dynamic>;
    final String checkInDate = hotelList['checkinDate'] ?? '';
    final String checkOutDate = hotelList['checkoutDate'] ?? '';
    final String latitude = hotelList['latitude']?.toString() ?? '';
    final String longitude = hotelList['longitude']?.toString() ?? '';

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
