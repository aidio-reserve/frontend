// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_reviews.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HotelReviews _$HotelReviewsFromJson(Map<String, dynamic> json) {
  return _HotelReviews.fromJson(json);
}

/// @nodoc
mixin _$HotelReviews {
  double get reviewAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelReviewsCopyWith<HotelReviews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelReviewsCopyWith<$Res> {
  factory $HotelReviewsCopyWith(
          HotelReviews value, $Res Function(HotelReviews) then) =
      _$HotelReviewsCopyWithImpl<$Res, HotelReviews>;
  @useResult
  $Res call({double reviewAverage});
}

/// @nodoc
class _$HotelReviewsCopyWithImpl<$Res, $Val extends HotelReviews>
    implements $HotelReviewsCopyWith<$Res> {
  _$HotelReviewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewAverage = null,
  }) {
    return _then(_value.copyWith(
      reviewAverage: null == reviewAverage
          ? _value.reviewAverage
          : reviewAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelReviewsImplCopyWith<$Res>
    implements $HotelReviewsCopyWith<$Res> {
  factory _$$HotelReviewsImplCopyWith(
          _$HotelReviewsImpl value, $Res Function(_$HotelReviewsImpl) then) =
      __$$HotelReviewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double reviewAverage});
}

/// @nodoc
class __$$HotelReviewsImplCopyWithImpl<$Res>
    extends _$HotelReviewsCopyWithImpl<$Res, _$HotelReviewsImpl>
    implements _$$HotelReviewsImplCopyWith<$Res> {
  __$$HotelReviewsImplCopyWithImpl(
      _$HotelReviewsImpl _value, $Res Function(_$HotelReviewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewAverage = null,
  }) {
    return _then(_$HotelReviewsImpl(
      reviewAverage: null == reviewAverage
          ? _value.reviewAverage
          : reviewAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelReviewsImpl implements _HotelReviews {
  _$HotelReviewsImpl({required this.reviewAverage});

  factory _$HotelReviewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelReviewsImplFromJson(json);

  @override
  final double reviewAverage;

  @override
  String toString() {
    return 'HotelReviews(reviewAverage: $reviewAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelReviewsImpl &&
            (identical(other.reviewAverage, reviewAverage) ||
                other.reviewAverage == reviewAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reviewAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelReviewsImplCopyWith<_$HotelReviewsImpl> get copyWith =>
      __$$HotelReviewsImplCopyWithImpl<_$HotelReviewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelReviewsImplToJson(
      this,
    );
  }
}

abstract class _HotelReviews implements HotelReviews {
  factory _HotelReviews({required final double reviewAverage}) =
      _$HotelReviewsImpl;

  factory _HotelReviews.fromJson(Map<String, dynamic> json) =
      _$HotelReviewsImpl.fromJson;

  @override
  double get reviewAverage;
  @override
  @JsonKey(ignore: true)
  _$$HotelReviewsImplCopyWith<_$HotelReviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
