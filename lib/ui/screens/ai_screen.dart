import 'package:aitrip/data/repositories/get_hotel_repository.dart';
import 'package:aitrip/services/hotel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiScreenProvider = Provider((_) => AiScreen());

class AiScreen extends ConsumerWidget {
  AiScreen({super.key});
  final TextEditingController controller = TextEditingController();
  final hotelInfoServiceProvider = Provider<HotelInfoService>((ref) {
    return HotelInfoService(HotelService());
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ここに、楽天APIに渡すhotel infoを入力します。',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final hotelInfoService = ref.read(hotelInfoServiceProvider);
                    await hotelInfoService.sendHotelInfoToAPI(ref, context);
                  },
                  child: const Text('実行'),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "メッセージを入力します",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
