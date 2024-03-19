import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelListProvider = StateProvider<List<Hotel>>((ref) => []);
