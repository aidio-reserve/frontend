// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      addressId: json['addressId'] as String,
      postalCode: json['postalCode'] as String,
      address: json['address'] as String,
      street: json['street'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'street': instance.street,
    };
