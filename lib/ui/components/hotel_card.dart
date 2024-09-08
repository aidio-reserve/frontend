import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:aitrip/ui/components/star_painter.dart';
import 'package:aitrip/ui/screens/hotel_screen/hotel_detail_screen.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatefulWidget {
  final Hotel hotel;
  const HotelCard({super.key, required this.hotel});

  @override
  HotelCardState createState() => HotelCardState();
}

class HotelCardState extends State<HotelCard> {
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
                    const BoxShadow(
                        color: Colors.black26, blurRadius: 10, spreadRadius: 1)
                  ]
                : [
                    const BoxShadow(
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
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '最安値: ¥${widget.hotel.hotelMinCharge}',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            fontSize: 16),
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
                        const SizedBox(width: 5),
                        Text(
                          widget.hotel.reviewAverage.toStringAsFixed(2),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
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
