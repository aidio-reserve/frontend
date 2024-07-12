// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'isPremium': instance.isPremium,
    };
