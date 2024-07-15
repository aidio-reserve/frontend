import 'package:aitrip/models/Hotels/bed.dart';
import 'package:aitrip/models/Hotels/hotel_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
class Hotel with _$Hotel {
  factory Hotel({
    required String hotelId,
    required String hotelName,
    required String hotelImageUrl,
    required HotelLocation hotelLocation,
    required int priceRange,
    required int roomSize,
    required Bed bed,
    @Default(true) bool isSmoking, //falseが禁煙、trueが喫煙
    @Default(false) bool isBreakfast,
    @Default(false) bool isAccessibility, //障害者への対応ありなし
    required int walkTimeFromNearestStation,
    required List<String> nearbyAttractions, //周辺の観光地
    required List<String> onSiteFacilities, //館内施設の有無
    required List<String> inRoomFacilities,
    required List<String> paymentOptions,
    @Default(false) bool isParking,
    required List<String> amenities,
    required List<String> cancellationPolicy,
    required String checkInTime,
    required int viewedCount,
    required int likedCount,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}
