import 'package:aitrip/providers/hotel_provider.dart';
import '../../../services/hotel_model_service.dart.dart';
import 'package:aitrip/ui/components/hotel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Hotel> hotels = ref.watch(hotelListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ホテル情報')),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(hotel: hotels[index]);
        },
      ),
    );
  }
}
