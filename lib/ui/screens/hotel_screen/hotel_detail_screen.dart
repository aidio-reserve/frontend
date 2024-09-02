import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:aitrip/ui/screens/hotel_screen/result_screen.dart';

class HotelDetail extends StatelessWidget {
  final Hotel hotel;
  const HotelDetail({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResultScreen()),
            );
          },
        ),
        title: const Text(
          'ホテル詳細',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        MediaQuery.of(context).padding.top) /
                    2,
                child: Image.network(
                  hotel.hotelImageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error));
                  },
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        MediaQuery.of(context).padding.top) /
                    4,
                child: Padding(
                  // 左右にパディングを追加
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36.0), // ここを変更
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        hotel.hotelName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 24),
                        textAlign: TextAlign.center, // テキストを中央揃え
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return CustomPaint(
                                painter: StarPainter(
                                  rating: hotel.reviewAverage,
                                  index: index,
                                ),
                                child: const SizedBox(width: 24, height: 24),
                              );
                            }),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${hotel.reviewAverage.toStringAsFixed(1)} / 5',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: WebViewWidget(
                    controller: WebViewController(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// StarPainterクラスをHotelDetailと同じファイルに統合
class StarPainter extends CustomPainter {
  final double rating;
  final int index;

  StarPainter({required this.rating, required this.index});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.amber;

    final starPath = Path()
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(size.width * 0.618, size.height * 0.38)
      ..lineTo(size.width, size.height * 0.38)
      ..lineTo(size.width * 0.691, size.height * 0.618)
      ..lineTo(size.width * 0.809, size.height)
      ..lineTo(size.width * 0.5, size.height * 0.764)
      ..lineTo(size.width * 0.191, size.height)
      ..lineTo(size.width * 0.309, size.height * 0.618)
      ..lineTo(0, size.height * 0.38)
      ..lineTo(size.width * 0.382, size.height * 0.38)
      ..close();

    double fillPercentage =
        ((rating - index).clamp(0.0, 1.0) * 100).ceilToDouble() / 100;

    canvas.save();
    canvas.clipRect(
        Rect.fromLTWH(0, 0, size.width * fillPercentage, size.height));
    canvas.drawPath(starPath, paint);
    canvas.restore();

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black54;

    canvas.drawPath(starPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
