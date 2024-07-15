// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ai _$AiFromJson(Map<String, dynamic> json) {
  return _Ai.fromJson(json);
}

/// @nodoc
mixin _$Ai {
  String get aiId => throw _privateConstructorUsedError;
  String get aiName => throw _privateConstructorUsedError;
  int get aiType => throw _privateConstructorUsedError;
  int get aiSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiCopyWith<Ai> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiCopyWith<$Res> {
  factory $AiCopyWith(Ai value, $Res Function(Ai) then) =
      _$AiCopyWithImpl<$Res, Ai>;
  @useResult
  $Res call({String aiId, String aiName, int aiType, int aiSpeed});
}

/// @nodoc
class _$AiCopyWithImpl<$Res, $Val extends Ai> implements $AiCopyWith<$Res> {
  _$AiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aiId = null,
    Object? aiName = null,
    Object? aiType = null,
    Object? aiSpeed = null,
  }) {
    return _then(_value.copyWith(
      aiId: null == aiId
          ? _value.aiId
          : aiId // ignore: cast_nullable_to_non_nullable
              as String,
      aiName: null == aiName
          ? _value.aiName
          : aiName // ignore: cast_nullable_to_non_nullable
              as String,
      aiType: null == aiType
          ? _value.aiType
          : aiType // ignore: cast_nullable_to_non_nullable
              as int,
      aiSpeed: null == aiSpeed
          ? _value.aiSpeed
          : aiSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiImplCopyWith<$Res> implements $AiCopyWith<$Res> {
  factory _$$AiImplCopyWith(_$AiImpl value, $Res Function(_$AiImpl) then) =
      __$$AiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String aiId, String aiName, int aiType, int aiSpeed});
}

/// @nodoc
class __$$AiImplCopyWithImpl<$Res> extends _$AiCopyWithImpl<$Res, _$AiImpl>
    implements _$$AiImplCopyWith<$Res> {
  __$$AiImplCopyWithImpl(_$AiImpl _value, $Res Function(_$AiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aiId = null,
    Object? aiName = null,
    Object? aiType = null,
    Object? aiSpeed = null,
  }) {
    return _then(_$AiImpl(
      aiId: null == aiId
          ? _value.aiId
          : aiId // ignore: cast_nullable_to_non_nullable
              as String,
      aiName: null == aiName
          ? _value.aiName
          : aiName // ignore: cast_nullable_to_non_nullable
              as String,
      aiType: null == aiType
          ? _value.aiType
          : aiType // ignore: cast_nullable_to_non_nullable
              as int,
      aiSpeed: null == aiSpeed
          ? _value.aiSpeed
          : aiSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiImpl implements _Ai {
  _$AiImpl(
      {required this.aiId,
      required this.aiName,
      required this.aiType,
      required this.aiSpeed});

  factory _$AiImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiImplFromJson(json);

  @override
  final String aiId;
  @override
  final String aiName;
  @override
  final int aiType;
  @override
  final int aiSpeed;

  @override
  String toString() {
    return 'Ai(aiId: $aiId, aiName: $aiName, aiType: $aiType, aiSpeed: $aiSpeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiImpl &&
            (identical(other.aiId, aiId) || other.aiId == aiId) &&
            (identical(other.aiName, aiName) || other.aiName == aiName) &&
            (identical(other.aiType, aiType) || other.aiType == aiType) &&
            (identical(other.aiSpeed, aiSpeed) || other.aiSpeed == aiSpeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aiId, aiName, aiType, aiSpeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiImplCopyWith<_$AiImpl> get copyWith =>
      __$$AiImplCopyWithImpl<_$AiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiImplToJson(
      this,
    );
  }
}

abstract class _Ai implements Ai {
  factory _Ai(
      {required final String aiId,
      required final String aiName,
      required final int aiType,
      required final int aiSpeed}) = _$AiImpl;

  factory _Ai.fromJson(Map<String, dynamic> json) = _$AiImpl.fromJson;

  @override
  String get aiId;
  @override
  String get aiName;
  @override
  int get aiType;
  @override
  int get aiSpeed;
  @override
  @JsonKey(ignore: true)
  _$$AiImplCopyWith<_$AiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
