import 'dart:async';
import 'dart:convert';

import 'package:aitrip/providers/hotel_provider.dart';
import 'package:aitrip/providers/message_list_provider.dart';
import 'package:aitrip/providers/message_provider.dart';
import 'package:aitrip/providers/thread_id_provider.dart';
import 'package:aitrip/providers/user_info_provider.dart';
import 'package:aitrip/ui/screens/ai_screen/voice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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

    if (userMessage.isNotEmpty) {
      ref.read(messageListProvider.notifier).addMessage(userMessage, true, 0);
      await messageService.sendMessage(threadId, userMessage);
      await userInfoService.sendUserInfoRequest(threadId);
      Map<String, dynamic> updatedUserInfo =
          ref.read(userInfoProvider)[threadId];
      String jsonUpdatedUserInfo = jsonEncode(updatedUserInfo);
      await hotelInfoService.sendHotelInfoToAPI(
          jsonUpdatedUserInfo, ref, context);
      clearUserMessage();
    }
  }

  void startListening(WidgetRef ref, BuildContext context) async {
    await _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        _onSpeechResult(result, ref, context);
      },
      pauseFor: const Duration(seconds: 2),
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
