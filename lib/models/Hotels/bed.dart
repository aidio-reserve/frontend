import 'package:freezed_annotation/freezed_annotation.dart';

part 'bed.freezed.dart';
part 'bed.g.dart';

@freezed
class Bed with _$Bed {
  factory Bed({
    required int bedType,
    required int bedCount,
  }) = _Bed;

  factory Bed.fromJson(Map<String, dynamic> json) => _$BedFromJson(json);
}
