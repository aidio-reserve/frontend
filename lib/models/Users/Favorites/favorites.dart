import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites.freezed.dart';
part 'favorites.g.dart';

@freezed
class Favorite with _$Favorite {
  factory Favorite({
    required String hotelId,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
