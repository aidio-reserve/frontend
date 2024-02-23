import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;
  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top) /
            5.5,
        width: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.network(
                          hotel.hotelImageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint(
                                '画像読み込みエラー: $error, スタックトレース: $stackTrace');
                            return const Center(child: Icon(Icons.error));
                          },
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                hotel.hotelName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                '最安値: ¥${hotel.hotelMinCharge}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  hotel.reviewAverage.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
