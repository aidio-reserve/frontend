// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      age: (json['age'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'isPremium': instance.isPremium,
    };
