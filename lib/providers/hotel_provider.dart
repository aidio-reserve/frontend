import 'package:aitrip/data/repositories/get_hotel_repository.dart';
import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:aitrip/services/hotel_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelListProvider = StateProvider<List<Hotel>>((ref) => []);

final hotelInfoServiceProvider = Provider<HotelInfoRepository>((ref) {
  return HotelInfoRepository(HotelService());
});
