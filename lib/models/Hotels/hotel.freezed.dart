// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hotel _$HotelFromJson(Map<String, dynamic> json) {
  return _Hotel.fromJson(json);
}

/// @nodoc
mixin _$Hotel {
  String get hotelId => throw _privateConstructorUsedError;
  String get hotelName => throw _privateConstructorUsedError;
  String get hotelImageUrl => throw _privateConstructorUsedError;
  HotelLocation get hotelLocation => throw _privateConstructorUsedError;
  int get priceRange => throw _privateConstructorUsedError;
  int get roomSize => throw _privateConstructorUsedError;
  Bed get bed => throw _privateConstructorUsedError;
  bool get isSmoking => throw _privateConstructorUsedError; //falseが禁煙、trueが喫煙
  bool get isBreakfast => throw _privateConstructorUsedError;
  bool get isAccessibility => throw _privateConstructorUsedError; //障害者への対応ありなし
  int get walkTimeFromNearestStation => throw _privateConstructorUsedError;
  List<String> get nearbyAttractions =>
      throw _privateConstructorUsedError; //周辺の観光地
  List<String> get onSiteFacilities =>
      throw _privateConstructorUsedError; //館内施設の有無
  List<String> get inRoomFacilities => throw _privateConstructorUsedError;
  List<String> get paymentOptions => throw _privateConstructorUsedError;
  bool get isParking => throw _privateConstructorUsedError;
  List<String> get amenities => throw _privateConstructorUsedError;
  List<String> get cancellationPolicy => throw _privateConstructorUsedError;
  String get checkInTime => throw _privateConstructorUsedError;
  int get viewedCount => throw _privateConstructorUsedError;
  int get likedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelCopyWith<Hotel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelCopyWith<$Res> {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) then) =
      _$HotelCopyWithImpl<$Res, Hotel>;
  @useResult
  $Res call(
      {String hotelId,
      String hotelName,
      String hotelImageUrl,
      HotelLocation hotelLocation,
      int priceRange,
      int roomSize,
      Bed bed,
      bool isSmoking,
      bool isBreakfast,
      bool isAccessibility,
      int walkTimeFromNearestStation,
      List<String> nearbyAttractions,
      List<String> onSiteFacilities,
      List<String> inRoomFacilities,
      List<String> paymentOptions,
      bool isParking,
      List<String> amenities,
      List<String> cancellationPolicy,
      String checkInTime,
      int viewedCount,
      int likedCount});

  $HotelLocationCopyWith<$Res> get hotelLocation;
  $BedCopyWith<$Res> get bed;
}

/// @nodoc
class _$HotelCopyWithImpl<$Res, $Val extends Hotel>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotelId = null,
    Object? hotelName = null,
    Object? hotelImageUrl = null,
    Object? hotelLocation = null,
    Object? priceRange = null,
    Object? roomSize = null,
    Object? bed = null,
    Object? isSmoking = null,
    Object? isBreakfast = null,
    Object? isAccessibility = null,
    Object? walkTimeFromNearestStation = null,
    Object? nearbyAttractions = null,
    Object? onSiteFacilities = null,
    Object? inRoomFacilities = null,
    Object? paymentOptions = null,
    Object? isParking = null,
    Object? amenities = null,
    Object? cancellationPolicy = null,
    Object? checkInTime = null,
    Object? viewedCount = null,
    Object? likedCount = null,
  }) {
    return _then(_value.copyWith(
      hotelId: null == hotelId
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as String,
      hotelName: null == hotelName
          ? _value.hotelName
          : hotelName // ignore: cast_nullable_to_non_nullable
              as String,
      hotelImageUrl: null == hotelImageUrl
          ? _value.hotelImageUrl
          : hotelImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hotelLocation: null == hotelLocation
          ? _value.hotelLocation
          : hotelLocation // ignore: cast_nullable_to_non_nullable
              as HotelLocation,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as int,
      roomSize: null == roomSize
          ? _value.roomSize
          : roomSize // ignore: cast_nullable_to_non_nullable
              as int,
      bed: null == bed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as Bed,
      isSmoking: null == isSmoking
          ? _value.isSmoking
          : isSmoking // ignore: cast_nullable_to_non_nullable
              as bool,
      isBreakfast: null == isBreakfast
          ? _value.isBreakfast
          : isBreakfast // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccessibility: null == isAccessibility
          ? _value.isAccessibility
          : isAccessibility // ignore: cast_nullable_to_non_nullable
              as bool,
      walkTimeFromNearestStation: null == walkTimeFromNearestStation
          ? _value.walkTimeFromNearestStation
          : walkTimeFromNearestStation // ignore: cast_nullable_to_non_nullable
              as int,
      nearbyAttractions: null == nearbyAttractions
          ? _value.nearbyAttractions
          : nearbyAttractions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onSiteFacilities: null == onSiteFacilities
          ? _value.onSiteFacilities
          : onSiteFacilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inRoomFacilities: null == inRoomFacilities
          ? _value.inRoomFacilities
          : inRoomFacilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paymentOptions: null == paymentOptions
          ? _value.paymentOptions
          : paymentOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isParking: null == isParking
          ? _value.isParking
          : isParking // ignore: cast_nullable_to_non_nullable
              as bool,
      amenities: null == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cancellationPolicy: null == cancellationPolicy
          ? _value.cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      checkInTime: null == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as String,
      viewedCount: null == viewedCount
          ? _value.viewedCount
          : viewedCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: null == likedCount
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HotelLocationCopyWith<$Res> get hotelLocation {
    return $HotelLocationCopyWith<$Res>(_value.hotelLocation, (value) {
      return _then(_value.copyWith(hotelLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BedCopyWith<$Res> get bed {
    return $BedCopyWith<$Res>(_value.bed, (value) {
      return _then(_value.copyWith(bed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HotelImplCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$$HotelImplCopyWith(
          _$HotelImpl value, $Res Function(_$HotelImpl) then) =
      __$$HotelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hotelId,
      String hotelName,
      String hotelImageUrl,
      HotelLocation hotelLocation,
      int priceRange,
      int roomSize,
      Bed bed,
      bool isSmoking,
      bool isBreakfast,
      bool isAccessibility,
      int walkTimeFromNearestStation,
      List<String> nearbyAttractions,
      List<String> onSiteFacilities,
      List<String> inRoomFacilities,
      List<String> paymentOptions,
      bool isParking,
      List<String> amenities,
      List<String> cancellationPolicy,
      String checkInTime,
      int viewedCount,
      int likedCount});

  @override
  $HotelLocationCopyWith<$Res> get hotelLocation;
  @override
  $BedCopyWith<$Res> get bed;
}

/// @nodoc
class __$$HotelImplCopyWithImpl<$Res>
    extends _$HotelCopyWithImpl<$Res, _$HotelImpl>
    implements _$$HotelImplCopyWith<$Res> {
  __$$HotelImplCopyWithImpl(
      _$HotelImpl _value, $Res Function(_$HotelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotelId = null,
    Object? hotelName = null,
    Object? hotelImageUrl = null,
    Object? hotelLocation = null,
    Object? priceRange = null,
    Object? roomSize = null,
    Object? bed = null,
    Object? isSmoking = null,
    Object? isBreakfast = null,
    Object? isAccessibility = null,
    Object? walkTimeFromNearestStation = null,
    Object? nearbyAttractions = null,
    Object? onSiteFacilities = null,
    Object? inRoomFacilities = null,
    Object? paymentOptions = null,
    Object? isParking = null,
    Object? amenities = null,
    Object? cancellationPolicy = null,
    Object? checkInTime = null,
    Object? viewedCount = null,
    Object? likedCount = null,
  }) {
    return _then(_$HotelImpl(
      hotelId: null == hotelId
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as String,
      hotelName: null == hotelName
          ? _value.hotelName
          : hotelName // ignore: cast_nullable_to_non_nullable
              as String,
      hotelImageUrl: null == hotelImageUrl
          ? _value.hotelImageUrl
          : hotelImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hotelLocation: null == hotelLocation
          ? _value.hotelLocation
          : hotelLocation // ignore: cast_nullable_to_non_nullable
              as HotelLocation,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as int,
      roomSize: null == roomSize
          ? _value.roomSize
          : roomSize // ignore: cast_nullable_to_non_nullable
              as int,
      bed: null == bed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as Bed,
      isSmoking: null == isSmoking
          ? _value.isSmoking
          : isSmoking // ignore: cast_nullable_to_non_nullable
              as bool,
      isBreakfast: null == isBreakfast
          ? _value.isBreakfast
          : isBreakfast // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccessibility: null == isAccessibility
          ? _value.isAccessibility
          : isAccessibility // ignore: cast_nullable_to_non_nullable
              as bool,
      walkTimeFromNearestStation: null == walkTimeFromNearestStation
          ? _value.walkTimeFromNearestStation
          : walkTimeFromNearestStation // ignore: cast_nullable_to_non_nullable
              as int,
      nearbyAttractions: null == nearbyAttractions
          ? _value._nearbyAttractions
          : nearbyAttractions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onSiteFacilities: null == onSiteFacilities
          ? _value._onSiteFacilities
          : onSiteFacilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inRoomFacilities: null == inRoomFacilities
          ? _value._inRoomFacilities
          : inRoomFacilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paymentOptions: null == paymentOptions
          ? _value._paymentOptions
          : paymentOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isParking: null == isParking
          ? _value.isParking
          : isParking // ignore: cast_nullable_to_non_nullable
              as bool,
      amenities: null == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cancellationPolicy: null == cancellationPolicy
          ? _value._cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      checkInTime: null == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as String,
      viewedCount: null == viewedCount
          ? _value.viewedCount
          : viewedCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: null == likedCount
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelImpl implements _Hotel {
  _$HotelImpl(
      {required this.hotelId,
      required this.hotelName,
      required this.hotelImageUrl,
      required this.hotelLocation,
      required this.priceRange,
      required this.roomSize,
      required this.bed,
      this.isSmoking = true,
      this.isBreakfast = false,
      this.isAccessibility = false,
      required this.walkTimeFromNearestStation,
      required final List<String> nearbyAttractions,
      required final List<String> onSiteFacilities,
      required final List<String> inRoomFacilities,
      required final List<String> paymentOptions,
      this.isParking = false,
      required final List<String> amenities,
      required final List<String> cancellationPolicy,
      required this.checkInTime,
      required this.viewedCount,
      required this.likedCount})
      : _nearbyAttractions = nearbyAttractions,
        _onSiteFacilities = onSiteFacilities,
        _inRoomFacilities = inRoomFacilities,
        _paymentOptions = paymentOptions,
        _amenities = amenities,
        _cancellationPolicy = cancellationPolicy;

  factory _$HotelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelImplFromJson(json);

  @override
  final String hotelId;
  @override
  final String hotelName;
  @override
  final String hotelImageUrl;
  @override
  final HotelLocation hotelLocation;
  @override
  final int priceRange;
  @override
  final int roomSize;
  @override
  final Bed bed;
  @override
  @JsonKey()
  final bool isSmoking;
//falseが禁煙、trueが喫煙
  @override
  @JsonKey()
  final bool isBreakfast;
  @override
  @JsonKey()
  final bool isAccessibility;
//障害者への対応ありなし
  @override
  final int walkTimeFromNearestStation;
  final List<String> _nearbyAttractions;
  @override
  List<String> get nearbyAttractions {
    if (_nearbyAttractions is EqualUnmodifiableListView)
      return _nearbyAttractions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nearbyAttractions);
  }

//周辺の観光地
  final List<String> _onSiteFacilities;
//周辺の観光地
  @override
  List<String> get onSiteFacilities {
    if (_onSiteFacilities is EqualUnmodifiableListView)
      return _onSiteFacilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onSiteFacilities);
  }

//館内施設の有無
  final List<String> _inRoomFacilities;
//館内施設の有無
  @override
  List<String> get inRoomFacilities {
    if (_inRoomFacilities is EqualUnmodifiableListView)
      return _inRoomFacilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inRoomFacilities);
  }

  final List<String> _paymentOptions;
  @override
  List<String> get paymentOptions {
    if (_paymentOptions is EqualUnmodifiableListView) return _paymentOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentOptions);
  }

  @override
  @JsonKey()
  final bool isParking;
  final List<String> _amenities;
  @override
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  final List<String> _cancellationPolicy;
  @override
  List<String> get cancellationPolicy {
    if (_cancellationPolicy is EqualUnmodifiableListView)
      return _cancellationPolicy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cancellationPolicy);
  }

  @override
  final String checkInTime;
  @override
  final int viewedCount;
  @override
  final int likedCount;

  @override
  String toString() {
    return 'Hotel(hotelId: $hotelId, hotelName: $hotelName, hotelImageUrl: $hotelImageUrl, hotelLocation: $hotelLocation, priceRange: $priceRange, roomSize: $roomSize, bed: $bed, isSmoking: $isSmoking, isBreakfast: $isBreakfast, isAccessibility: $isAccessibility, walkTimeFromNearestStation: $walkTimeFromNearestStation, nearbyAttractions: $nearbyAttractions, onSiteFacilities: $onSiteFacilities, inRoomFacilities: $inRoomFacilities, paymentOptions: $paymentOptions, isParking: $isParking, amenities: $amenities, cancellationPolicy: $cancellationPolicy, checkInTime: $checkInTime, viewedCount: $viewedCount, likedCount: $likedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelImpl &&
            (identical(other.hotelId, hotelId) || other.hotelId == hotelId) &&
            (identical(other.hotelName, hotelName) ||
                other.hotelName == hotelName) &&
            (identical(other.hotelImageUrl, hotelImageUrl) ||
                other.hotelImageUrl == hotelImageUrl) &&
            (identical(other.hotelLocation, hotelLocation) ||
                other.hotelLocation == hotelLocation) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.roomSize, roomSize) ||
                other.roomSize == roomSize) &&
            (identical(other.bed, bed) || other.bed == bed) &&
            (identical(other.isSmoking, isSmoking) ||
                other.isSmoking == isSmoking) &&
            (identical(other.isBreakfast, isBreakfast) ||
                other.isBreakfast == isBreakfast) &&
            (identical(other.isAccessibility, isAccessibility) ||
                other.isAccessibility == isAccessibility) &&
            (identical(other.walkTimeFromNearestStation,
                    walkTimeFromNearestStation) ||
                other.walkTimeFromNearestStation ==
                    walkTimeFromNearestStation) &&
            const DeepCollectionEquality()
                .equals(other._nearbyAttractions, _nearbyAttractions) &&
            const DeepCollectionEquality()
                .equals(other._onSiteFacilities, _onSiteFacilities) &&
            const DeepCollectionEquality()
                .equals(other._inRoomFacilities, _inRoomFacilities) &&
            const DeepCollectionEquality()
                .equals(other._paymentOptions, _paymentOptions) &&
            (identical(other.isParking, isParking) ||
                other.isParking == isParking) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            const DeepCollectionEquality()
                .equals(other._cancellationPolicy, _cancellationPolicy) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.viewedCount, viewedCount) ||
                other.viewedCount == viewedCount) &&
            (identical(other.likedCount, likedCount) ||
                other.likedCount == likedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        hotelId,
        hotelName,
        hotelImageUrl,
        hotelLocation,
        priceRange,
        roomSize,
        bed,
        isSmoking,
        isBreakfast,
        isAccessibility,
        walkTimeFromNearestStation,
        const DeepCollectionEquality().hash(_nearbyAttractions),
        const DeepCollectionEquality().hash(_onSiteFacilities),
        const DeepCollectionEquality().hash(_inRoomFacilities),
        const DeepCollectionEquality().hash(_paymentOptions),
        isParking,
        const DeepCollectionEquality().hash(_amenities),
        const DeepCollectionEquality().hash(_cancellationPolicy),
        checkInTime,
        viewedCount,
        likedCount
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      __$$HotelImplCopyWithImpl<_$HotelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelImplToJson(
      this,
    );
  }
}

abstract class _Hotel implements Hotel {
  factory _Hotel(
      {required final String hotelId,
      required final String hotelName,
      required final String hotelImageUrl,
      required final HotelLocation hotelLocation,
      required final int priceRange,
      required final int roomSize,
      required final Bed bed,
      final bool isSmoking,
      final bool isBreakfast,
      final bool isAccessibility,
      required final int walkTimeFromNearestStation,
      required final List<String> nearbyAttractions,
      required final List<String> onSiteFacilities,
      required final List<String> inRoomFacilities,
      required final List<String> paymentOptions,
      final bool isParking,
      required final List<String> amenities,
      required final List<String> cancellationPolicy,
      required final String checkInTime,
      required final int viewedCount,
      required final int likedCount}) = _$HotelImpl;

  factory _Hotel.fromJson(Map<String, dynamic> json) = _$HotelImpl.fromJson;

  @override
  String get hotelId;
  @override
  String get hotelName;
  @override
  String get hotelImageUrl;
  @override
  HotelLocation get hotelLocation;
  @override
  int get priceRange;
  @override
  int get roomSize;
  @override
  Bed get bed;
  @override
  bool get isSmoking;
  @override //falseが禁煙、trueが喫煙
  bool get isBreakfast;
  @override
  bool get isAccessibility;
  @override //障害者への対応ありなし
  int get walkTimeFromNearestStation;
  @override
  List<String> get nearbyAttractions;
  @override //周辺の観光地
  List<String> get onSiteFacilities;
  @override //館内施設の有無
  List<String> get inRoomFacilities;
  @override
  List<String> get paymentOptions;
  @override
  bool get isParking;
  @override
  List<String> get amenities;
  @override
  List<String> get cancellationPolicy;
  @override
  String get checkInTime;
  @override
  int get viewedCount;
  @override
  int get likedCount;
  @override
  @JsonKey(ignore: true)
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
