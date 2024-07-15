import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
class Hotel with _$Hotel {
  factory Hotel({
    required String hotelId,
    required String hotelName,
    required String hotelImageUrl,
    required String hotelLocation,
    required String priceRange,
    required String roomSize,
    required String bed,
    @Default(true) bool isSmoking, //falseが禁煙、trueが喫煙
    @Default(false) bool isBreakfast,
    @Default(false) bool isAccessibility, //障害者への対応ありなし
    required String hotelReviews,
    required String walkTimeFromNearestStation,
    required String nearbyAttractions, //周辺の観光地
    required String onSiteFacilities, //館内施設の有無
    required String mapInformation, //地図情報
    required String inRoomAmenities,
    required String paymentOptions,
    @Default(false) bool isParking,
    required String amenities,
    required String cancellationPolicy,
    required String checkInTime,
    @Default(false) bool isBookmark,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}
