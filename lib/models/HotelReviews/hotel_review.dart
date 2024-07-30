import 'package:aitrip/converters/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_review.freezed.dart';
part 'hotel_review.g.dart';

@freezed
class HotelReview with _$HotelReview {
  factory HotelReview({
    required String reviewerName,
    @TimestampConverter() required Timestamp reviewTime,
    required String comment,
    required int review,
  }) = _HotelReview;

  factory HotelReview.fromJson(Map<String, dynamic> json) =>
      _$HotelReviewFromJson(json);
}
