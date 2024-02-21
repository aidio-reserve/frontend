import 'package:aitrip/services/result_cut_service.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // スクロール内スクロールの問題を防ぐ
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              final hotel = hotels[index];
              return Card(
                child: ListTile(
                  title: Text(hotel.hotelName),
                  onTap: () {
                    // 詳細ページへのナビゲーションやその他のアクションをここに追加
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
