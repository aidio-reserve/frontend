// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelReviewImpl _$$HotelReviewImplFromJson(Map<String, dynamic> json) =>
    _$HotelReviewImpl(
      reviewerName: json['reviewerName'] as String,
      reviewTime:
          const TimestampConverter().fromJson(json['reviewTime'] as DateTime),
      comment: json['comment'] as String,
      review: (json['review'] as num).toInt(),
    );

Map<String, dynamic> _$$HotelReviewImplToJson(_$HotelReviewImpl instance) =>
    <String, dynamic>{
      'reviewerName': instance.reviewerName,
      'reviewTime': const TimestampConverter().toJson(instance.reviewTime),
      'comment': instance.comment,
      'review': instance.review,
    };
