// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HotelLocation _$HotelLocationFromJson(Map<String, dynamic> json) {
  return _HotelLocation.fromJson(json);
}

/// @nodoc
mixin _$HotelLocation {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelLocationCopyWith<HotelLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelLocationCopyWith<$Res> {
  factory $HotelLocationCopyWith(
          HotelLocation value, $Res Function(HotelLocation) then) =
      _$HotelLocationCopyWithImpl<$Res, HotelLocation>;
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class _$HotelLocationCopyWithImpl<$Res, $Val extends HotelLocation>
    implements $HotelLocationCopyWith<$Res> {
  _$HotelLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelLocationImplCopyWith<$Res>
    implements $HotelLocationCopyWith<$Res> {
  factory _$$HotelLocationImplCopyWith(
          _$HotelLocationImpl value, $Res Function(_$HotelLocationImpl) then) =
      __$$HotelLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class __$$HotelLocationImplCopyWithImpl<$Res>
    extends _$HotelLocationCopyWithImpl<$Res, _$HotelLocationImpl>
    implements _$$HotelLocationImplCopyWith<$Res> {
  __$$HotelLocationImplCopyWithImpl(
      _$HotelLocationImpl _value, $Res Function(_$HotelLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$HotelLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelLocationImpl implements _HotelLocation {
  _$HotelLocationImpl({required this.latitude, required this.longitude});

  factory _$HotelLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelLocationImplFromJson(json);

  @override
  final String latitude;
  @override
  final String longitude;

  @override
  String toString() {
    return 'HotelLocation(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelLocationImplCopyWith<_$HotelLocationImpl> get copyWith =>
      __$$HotelLocationImplCopyWithImpl<_$HotelLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelLocationImplToJson(
      this,
    );
  }
}

abstract class _HotelLocation implements HotelLocation {
  factory _HotelLocation(
      {required final String latitude,
      required final String longitude}) = _$HotelLocationImpl;

  factory _HotelLocation.fromJson(Map<String, dynamic> json) =
      _$HotelLocationImpl.fromJson;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$HotelLocationImplCopyWith<_$HotelLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
