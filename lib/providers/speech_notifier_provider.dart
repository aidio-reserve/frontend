import 'dart:async';
import 'dart:convert';
import 'package:aitrip/models/Users/Conversations/messages.dart';
import 'package:aitrip/providers/display_hotel_provider.dart';
import 'package:aitrip/providers/hotel_option_provider.dart';
import 'package:aitrip/providers/hotel_provider.dart';
import 'package:aitrip/providers/loading_provider.dart';
import 'package:aitrip/providers/message_provider.dart';
import 'package:aitrip/providers/thread_id_provider.dart';
import 'package:aitrip/providers/user_info_provider.dart';
import 'package:aitrip/ui/screens/hotel_screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechState {
  final String lastWords;
  final bool isListening;
  final bool isSpeechEnabled;

  SpeechState({
    this.lastWords = '',
    this.isListening = false,
    this.isSpeechEnabled = false,
  });
}

final speechProvider = StateNotifierProvider<SpeechNotifier, SpeechState>(
  (ref) => SpeechNotifier(),
);

class SpeechNotifier extends StateNotifier<SpeechState> {
  final SpeechToText _speechToText = SpeechToText();
  Timer? _silenceTimer;

  SpeechNotifier() : super(SpeechState()) {
    _initSpeech();
  }

  void _initSpeech() async {
    bool available = await _speechToText.initialize();
    state = state.copyWith(isSpeechEnabled: available);
  }

  Future<void> sendVoiceMessage(WidgetRef ref, BuildContext context) async {
    final messageService = ref.read(messageProvider);
    final threadId = ref.read(threadIdProvider);
    final userMessage = state.lastWords;
    final userInfoService = ref.read(exportUserInfoProvider);
    final hotelInfoService = ref.read(hotelInfoServiceProvider);
    ref.read(hotelOptionProvider.notifier).state =
        ref.read(messageListProvider).last.hotelOption;
    final hotelOption = ref.read(hotelOptionProvider);

    if (userMessage.isNotEmpty) {
      //ここに現在のhotelOptionを取得してaddMessageに入れる処理を追加。providerも追加。
      ref
          .read(messageListProvider.notifier)
          .addMessage(userMessage, true, hotelOption, false);
      await messageService.sendMessage(threadId, userMessage);
      await userInfoService.sendUserInfoRequest(threadId);
      Map<String, dynamic> updatedUserInfo =
          ref.read(userInfoProvider)[threadId];
      String jsonUpdatedUserInfo = jsonEncode(updatedUserInfo);
      if (context.mounted) {
        await hotelInfoService.sendHotelInfoToAPI(
            jsonUpdatedUserInfo, ref, context);
        clearUserMessage();
      }
      ref.read(displayHotelProvider.notifier).state =
          ref.read(messageListProvider).last.displayHotel;
      final displayHotel = ref.read(displayHotelProvider);

      //もしdisplayHotelが1であれば、ホテル情報を取得し、画面遷移を実装する。
      debugPrint('displayHotel: $displayHotel');
      if (displayHotel == true) {
        debugPrint('ホテル情報を取得します');
        if (context.mounted) {
          await hotelInfoService.sendHotelInfoToAPI(
              jsonUpdatedUserInfo, ref, context);
        }
        debugPrint('Navigating to ResultScreen');
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ResultScreen()),
          );
        }
      } else {
        debugPrint('displayHotelがtrueではないため、ホテル情報を取得しません');
      }
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }

  void startListening(WidgetRef ref, BuildContext context) async {
    await _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        _onSpeechResult(result, ref, context);
      },
      pauseFor: const Duration(seconds: 4),
    );
    state = state.copyWith(isListening: true);
  }

  void stopListening() async {
    await _speechToText.stop();
    state = state.copyWith(isListening: false);
    _silenceTimer?.cancel();
  }

  void _onSpeechResult(
      SpeechRecognitionResult result, WidgetRef ref, BuildContext context) {
    state = state.copyWith(lastWords: result.recognizedWords);

    _silenceTimer?.cancel();
    _silenceTimer = Timer(const Duration(seconds: 2), () {
      if (_speechToText.isNotListening && state.isListening) {
        state = state.copyWith(isListening: false);
        showLoading(ref);
        sendVoiceMessage(ref, context);
      }
    });
  }

  void reset() {
    state = state.copyWith(lastWords: '');
  }

  void clearUserMessage() {
    state = state.copyWith(lastWords: '');
  }
}

Future<void> showLoading(WidgetRef ref) async {
  ref.read(isLoadingProvider.notifier).state = true;
  debugPrint('isLoadingがtrueになりました');
}

extension SpeechStateCopyWith on SpeechState {
  SpeechState copyWith({
    String? lastWords,
    bool? isListening,
    bool? isSpeechEnabled,
  }) {
    return SpeechState(
      lastWords: lastWords ?? this.lastWords,
      isListening: isListening ?? this.isListening,
      isSpeechEnabled: isSpeechEnabled ?? this.isSpeechEnabled,
    );
  }
}
