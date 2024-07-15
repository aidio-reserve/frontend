// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bed _$BedFromJson(Map<String, dynamic> json) {
  return _Bed.fromJson(json);
}

/// @nodoc
mixin _$Bed {
  int get bedType => throw _privateConstructorUsedError;
  int get bedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BedCopyWith<Bed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BedCopyWith<$Res> {
  factory $BedCopyWith(Bed value, $Res Function(Bed) then) =
      _$BedCopyWithImpl<$Res, Bed>;
  @useResult
  $Res call({int bedType, int bedCount});
}

/// @nodoc
class _$BedCopyWithImpl<$Res, $Val extends Bed> implements $BedCopyWith<$Res> {
  _$BedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bedType = null,
    Object? bedCount = null,
  }) {
    return _then(_value.copyWith(
      bedType: null == bedType
          ? _value.bedType
          : bedType // ignore: cast_nullable_to_non_nullable
              as int,
      bedCount: null == bedCount
          ? _value.bedCount
          : bedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BedImplCopyWith<$Res> implements $BedCopyWith<$Res> {
  factory _$$BedImplCopyWith(_$BedImpl value, $Res Function(_$BedImpl) then) =
      __$$BedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int bedType, int bedCount});
}

/// @nodoc
class __$$BedImplCopyWithImpl<$Res> extends _$BedCopyWithImpl<$Res, _$BedImpl>
    implements _$$BedImplCopyWith<$Res> {
  __$$BedImplCopyWithImpl(_$BedImpl _value, $Res Function(_$BedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bedType = null,
    Object? bedCount = null,
  }) {
    return _then(_$BedImpl(
      bedType: null == bedType
          ? _value.bedType
          : bedType // ignore: cast_nullable_to_non_nullable
              as int,
      bedCount: null == bedCount
          ? _value.bedCount
          : bedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BedImpl implements _Bed {
  _$BedImpl({required this.bedType, required this.bedCount});

  factory _$BedImpl.fromJson(Map<String, dynamic> json) =>
      _$$BedImplFromJson(json);

  @override
  final int bedType;
  @override
  final int bedCount;

  @override
  String toString() {
    return 'Bed(bedType: $bedType, bedCount: $bedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BedImpl &&
            (identical(other.bedType, bedType) || other.bedType == bedType) &&
            (identical(other.bedCount, bedCount) ||
                other.bedCount == bedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bedType, bedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BedImplCopyWith<_$BedImpl> get copyWith =>
      __$$BedImplCopyWithImpl<_$BedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BedImplToJson(
      this,
    );
  }
}

abstract class _Bed implements Bed {
  factory _Bed({required final int bedType, required final int bedCount}) =
      _$BedImpl;

  factory _Bed.fromJson(Map<String, dynamic> json) = _$BedImpl.fromJson;

  @override
  int get bedType;
  @override
  int get bedCount;
  @override
  @JsonKey(ignore: true)
  _$$BedImplCopyWith<_$BedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
