import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:aitrip/ui/components/hotel_card.dart';
import 'package:flutter/material.dart';

// HotelとRoomクラスをインポートする必要があるかもしれません
// import 'path_to_your_hotel_class.dart';

class ResultScreen extends StatelessWidget {
  final List<Hotel> hotels;

  const ResultScreen({Key? key, required this.hotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホテル情報'),
      ),
      body: ListView.builder(
        itemCount: hotels.length, // ホテルの数だけリストアイテムを生成
        itemBuilder: (context, index) {
          // HotelCardにホテル情報を渡して生成
          return HotelCard(hotel: hotels[index]);
        },
      ),
    );
  }
}
