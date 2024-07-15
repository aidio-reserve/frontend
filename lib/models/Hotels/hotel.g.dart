// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelImpl _$$HotelImplFromJson(Map<String, dynamic> json) => _$HotelImpl(
      hotelId: json['hotelId'] as String,
      hotelName: json['hotelName'] as String,
      hotelImageUrl: json['hotelImageUrl'] as String,
      hotelLocation:
          HotelLocation.fromJson(json['hotelLocation'] as Map<String, dynamic>),
      priceRange: (json['priceRange'] as num).toInt(),
      roomSize: (json['roomSize'] as num).toInt(),
      bed: Bed.fromJson(json['bed'] as Map<String, dynamic>),
      isSmoking: json['isSmoking'] as bool? ?? true,
      isBreakfast: json['isBreakfast'] as bool? ?? false,
      isAccessibility: json['isAccessibility'] as bool? ?? false,
      walkTimeFromNearestStation:
          (json['walkTimeFromNearestStation'] as num).toInt(),
      nearbyAttractions: (json['nearbyAttractions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      onSiteFacilities: (json['onSiteFacilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      inRoomFacilities: (json['inRoomFacilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      paymentOptions: (json['paymentOptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isParking: json['isParking'] as bool? ?? false,
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      cancellationPolicy: (json['cancellationPolicy'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      checkInTime: json['checkInTime'] as String,
      viewedCount: (json['viewedCount'] as num).toInt(),
      likedCount: (json['likedCount'] as num).toInt(),
    );

Map<String, dynamic> _$$HotelImplToJson(_$HotelImpl instance) =>
    <String, dynamic>{
      'hotelId': instance.hotelId,
      'hotelName': instance.hotelName,
      'hotelImageUrl': instance.hotelImageUrl,
      'hotelLocation': instance.hotelLocation,
      'priceRange': instance.priceRange,
      'roomSize': instance.roomSize,
      'bed': instance.bed,
      'isSmoking': instance.isSmoking,
      'isBreakfast': instance.isBreakfast,
      'isAccessibility': instance.isAccessibility,
      'walkTimeFromNearestStation': instance.walkTimeFromNearestStation,
      'nearbyAttractions': instance.nearbyAttractions,
      'onSiteFacilities': instance.onSiteFacilities,
      'inRoomFacilities': instance.inRoomFacilities,
      'paymentOptions': instance.paymentOptions,
      'isParking': instance.isParking,
      'amenities': instance.amenities,
      'cancellationPolicy': instance.cancellationPolicy,
      'checkInTime': instance.checkInTime,
      'viewedCount': instance.viewedCount,
      'likedCount': instance.likedCount,
    };
