import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:aitrip/ui/screens/hotel_screen/hotel_detail_screen.dart';
import 'package:flutter/material.dart';

// 変更点1: StatefulWidgetに変更
class HotelCard extends StatefulWidget {
  final Hotel hotel;
  const HotelCard({super.key, required this.hotel});

  @override
  _HotelCardState createState() => _HotelCardState();
}

// 変更点2: Stateクラスを作成
class _HotelCardState extends State<HotelCard> {
  bool _isHovered = false; // ホバー状態を管理する変数

  @override
  Widget build(BuildContext context) {
    return MouseRegion( // 変更点3: MouseRegionを追加
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
        child: AnimatedContainer( // 変更点4: AnimatedContainerを使用
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -10)) // ホバー時に上に移動
              : Matrix4.identity(),
          decoration: BoxDecoration( // 変更点5: boxShadowを追加
            boxShadow: _isHovered
                ? [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 1)]
                : [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
          ),
      child: Card(
        child: SizedBox(
          height: (MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top) / 
              3.0, // 高さを変更
          width: double.infinity,
          child: Stack(
            children: [
              Padding( // Paddingウィジェット追加
                padding: const EdgeInsets.all(8.0), // 追加
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 追加
                  children: [
                    Expanded( // Expandedウィジェット追加開始
                    child : Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            widget.hotel.hotelImageUrl,
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
                            padding: const EdgeInsets.only(left: 16.0), // 左のパディングを増やす
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center, // 垂直方向の中央に配置
                              children: [
                                Text(
                                  widget.hotel.hotelName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20, // サイズを24から20に変更
                                  ),
                                ),
                                Text(
                                  '最安値: ¥${widget.hotel.hotelMinCharge}',
                                  style: const TextStyle(fontSize: 16), // サイズを20から16に変更
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
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.hotel.reviewAverage.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
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
