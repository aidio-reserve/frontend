import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai.freezed.dart';
part 'ai.g.dart';

@freezed
class Ai with _$Ai {
  factory Ai({
    required String aiId,
    required String aiName,
    required String aiType,
    required String aiSpeed,
  }) = _Ai;

  factory Ai.fromJson(Map<String, dynamic> json) => _$AiFromJson(json);
}
