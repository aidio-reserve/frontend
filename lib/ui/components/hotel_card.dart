import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:aitrip/ui/screens/hotel_screen/hotel_detail_screen.dart';
import 'package:flutter/material.dart';

//StatefulWidgetに変更
class HotelCard extends StatefulWidget {
  final Hotel hotel;
  const HotelCard({super.key, required this.hotel});

  @override
  _HotelCardState createState() => _HotelCardState();
}

//Stateクラスを作成
class _HotelCardState extends State<HotelCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelDetail(hotel: widget.hotel),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -10))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 10, spreadRadius: 1)
                  ]
                : [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 5, spreadRadius: 1)
                  ],
          ),
          child: Card(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top) /
                  3.0,
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.network(
                                  widget.hotel.hotelImageUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    debugPrint(
                                        '画像読み込みエラー: $error, スタックトレース: $stackTrace');
                                    return const Center(
                                        child: Icon(Icons.error));
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.hotel.hotelName,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '最安値: ¥${widget.hotel.hotelMinCharge}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return CustomPaint(
                              painter: StarPainter(
                                rating: widget.hotel.reviewAverage,
                                index: index,
                              ),
                              child: const SizedBox(width: 24, height: 24),
                            );
                          }),
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.hotel.reviewAverage.toStringAsFixed(2),
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
