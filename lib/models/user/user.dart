import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  //プロパティを指定
  factory User({
    required String name,
    required String email,
    required String password,
    required int age, // 1:male,2:female,3:other
    required String phoneNumber,
    required String address,
    @Default(false) bool isPremium,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
