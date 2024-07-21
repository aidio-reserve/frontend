import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelOptionProvider =
    NotifierProvider<HotelOptionNotifier, Map<String, dynamic>?>(
  HotelOptionNotifier.new,
);

class HotelOptionNotifier extends Notifier<Map<String, dynamic>?> {
  @override
  Map<String, dynamic>? build() {
    return null;
  }

  void updateHotelOption(Map<String, dynamic> hotelOption) {
    state = hotelOption;
    debugPrint('HotelOption updated: $hotelOption');
  }

  void clearHotelOption() {
    state = null;
  }
}
