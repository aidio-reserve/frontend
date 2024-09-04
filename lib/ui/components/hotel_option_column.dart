import 'package:aitrip/providers/hotel_option_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotelOptionColumn extends ConsumerWidget {
  const HotelOptionColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelOption = ref.watch(hotelOptionProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hotelOption["hotel_location"] != null
            ? Text(
                "宿泊先：${hotelOption["hotel_location"]}",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              )
            : Text(
                "宿泊先：",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
        const SizedBox(height: 8),
        hotelOption["checkinDate"] != null &&
                hotelOption["checkoutDate"] != null
            ? Text(
                "日程：${hotelOption["checkinDate"]} 〜 ${hotelOption["checkoutDate"]}",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              )
            : Text(
                "日程：",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
        const SizedBox(height: 8),
        hotelOption["adultNum"] != null
            ? Text(
                "人数：${hotelOption["adultNum"]}",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              )
            : Text(
                "人数：",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
        const SizedBox(height: 8),
        hotelOption["minCharge"] != null && hotelOption["maxCharge"] != null
            ? Text(
                "値段帯：${hotelOption["minCharge"]}円 〜 ${hotelOption["maxCharge"]}円",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              )
            : Text(
                "値段帯：",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
        const SizedBox(height: 8),
        hotelOption["roomNum"] != null
            ? Text(
                "部屋のサイズ：${hotelOption["roomNum"]}部屋", // TODO 部屋のサイズをBEから取得する
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              )
            : Text(
                "部屋のサイズ：",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
        const SizedBox(height: 8),
      ],
    );
  }
}
