import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_location.freezed.dart';
part 'hotel_location.g.dart';

@freezed
class HotelLocation with _$HotelLocation {
  factory HotelLocation({
    required String latitude,
    required String longitude,
  }) = _HotelLocation;

  factory HotelLocation.fromJson(Map<String, dynamic> json) =>
      _$HotelLocationFromJson(json);
}
