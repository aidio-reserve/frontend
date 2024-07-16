// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HotelReview _$HotelReviewFromJson(Map<String, dynamic> json) {
  return _HotelReview.fromJson(json);
}

/// @nodoc
mixin _$HotelReview {
  String get reviewerName => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get reviewTime => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelReviewCopyWith<HotelReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelReviewCopyWith<$Res> {
  factory $HotelReviewCopyWith(
          HotelReview value, $Res Function(HotelReview) then) =
      _$HotelReviewCopyWithImpl<$Res, HotelReview>;
  @useResult
  $Res call(
      {String reviewerName,
      @TimestampConverter() Timestamp reviewTime,
      String comment,
      int review});
}

/// @nodoc
class _$HotelReviewCopyWithImpl<$Res, $Val extends HotelReview>
    implements $HotelReviewCopyWith<$Res> {
  _$HotelReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewerName = null,
    Object? reviewTime = null,
    Object? comment = null,
    Object? review = null,
  }) {
    return _then(_value.copyWith(
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewTime: null == reviewTime
          ? _value.reviewTime
          : reviewTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelReviewImplCopyWith<$Res>
    implements $HotelReviewCopyWith<$Res> {
  factory _$$HotelReviewImplCopyWith(
          _$HotelReviewImpl value, $Res Function(_$HotelReviewImpl) then) =
      __$$HotelReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reviewerName,
      @TimestampConverter() Timestamp reviewTime,
      String comment,
      int review});
}

/// @nodoc
class __$$HotelReviewImplCopyWithImpl<$Res>
    extends _$HotelReviewCopyWithImpl<$Res, _$HotelReviewImpl>
    implements _$$HotelReviewImplCopyWith<$Res> {
  __$$HotelReviewImplCopyWithImpl(
      _$HotelReviewImpl _value, $Res Function(_$HotelReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewerName = null,
    Object? reviewTime = null,
    Object? comment = null,
    Object? review = null,
  }) {
    return _then(_$HotelReviewImpl(
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewTime: null == reviewTime
          ? _value.reviewTime
          : reviewTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelReviewImpl implements _HotelReview {
  _$HotelReviewImpl(
      {required this.reviewerName,
      @TimestampConverter() required this.reviewTime,
      required this.comment,
      required this.review});

  factory _$HotelReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelReviewImplFromJson(json);

  @override
  final String reviewerName;
  @override
  @TimestampConverter()
  final Timestamp reviewTime;
  @override
  final String comment;
  @override
  final int review;

  @override
  String toString() {
    return 'HotelReview(reviewerName: $reviewerName, reviewTime: $reviewTime, comment: $comment, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelReviewImpl &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.reviewTime, reviewTime) ||
                other.reviewTime == reviewTime) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reviewerName, reviewTime, comment, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelReviewImplCopyWith<_$HotelReviewImpl> get copyWith =>
      __$$HotelReviewImplCopyWithImpl<_$HotelReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelReviewImplToJson(
      this,
    );
  }
}

abstract class _HotelReview implements HotelReview {
  factory _HotelReview(
      {required final String reviewerName,
      @TimestampConverter() required final Timestamp reviewTime,
      required final String comment,
      required final int review}) = _$HotelReviewImpl;

  factory _HotelReview.fromJson(Map<String, dynamic> json) =
      _$HotelReviewImpl.fromJson;

  @override
  String get reviewerName;
  @override
  @TimestampConverter()
  Timestamp get reviewTime;
  @override
  String get comment;
  @override
  int get review;
  @override
  @JsonKey(ignore: true)
  _$$HotelReviewImplCopyWith<_$HotelReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
