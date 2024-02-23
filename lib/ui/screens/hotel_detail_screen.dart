import 'package:aitrip/services/hotel_model_service.dart.dart';
import 'package:flutter/material.dart';

class HotelDetail extends StatelessWidget {
  final Hotel hotel;
  const HotelDetail({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(),
    );
  }
}
