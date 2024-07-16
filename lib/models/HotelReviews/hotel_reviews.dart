import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_reviews.freezed.dart';
part 'hotel_reviews.g.dart';

@freezed
class HotelReviews with _$HotelReviews {
  factory HotelReviews({required double reviewAverage}) = _HotelReviews;

  factory HotelReviews.fromJson(Map<String, dynamic> json) =>
      _$HotelReviewsFromJson(json);
}
