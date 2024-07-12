// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelImpl _$$HotelImplFromJson(Map<String, dynamic> json) => _$HotelImpl(
      hotelId: json['hotelId'] as String,
      hotelName: json['hotelName'] as String,
      hotelImageUrl: json['hotelImageUrl'] as String,
      hotelLocation: json['hotelLocation'] as String,
      priceRange: json['priceRange'] as String,
      roomSize: json['roomSize'] as String,
      bed: json['bed'] as String,
      isSmoking: json['isSmoking'] as bool? ?? true,
      isBreakfast: json['isBreakfast'] as bool? ?? false,
      isAccessibility: json['isAccessibility'] as bool? ?? false,
      hotelReviews: json['hotelReviews'] as String,
      walkTimeFromNearestStation: json['walkTimeFromNearestStation'] as String,
      nearbyAttractions: json['nearbyAttractions'] as String,
      onSiteFacilities: json['onSiteFacilities'] as String,
      mapInformation: json['mapInformation'] as String,
      inRoomAmenities: json['inRoomAmenities'] as String,
      paymentOptions: json['paymentOptions'] as String,
      isParking: json['isParking'] as bool? ?? false,
      amenities: json['amenities'] as String,
      cancellationPolicy: json['cancellationPolicy'] as String,
      checkInTime: json['checkInTime'] as String,
      isBookmark: json['isBookmark'] as bool? ?? false,
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
      'hotelReviews': instance.hotelReviews,
      'walkTimeFromNearestStation': instance.walkTimeFromNearestStation,
      'nearbyAttractions': instance.nearbyAttractions,
      'onSiteFacilities': instance.onSiteFacilities,
      'mapInformation': instance.mapInformation,
      'inRoomAmenities': instance.inRoomAmenities,
      'paymentOptions': instance.paymentOptions,
      'isParking': instance.isParking,
      'amenities': instance.amenities,
      'cancellationPolicy': instance.cancellationPolicy,
      'checkInTime': instance.checkInTime,
      'isBookmark': instance.isBookmark,
    };
