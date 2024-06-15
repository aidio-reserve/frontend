import 'package:aitrip/models/messages.dart';
import 'package:aitrip/providers/speech_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeechState {
  final String lastWords;
  final bool isListening;
  final bool isSpeechEnabled;

  //コンストラクタ
  SpeechState({
    this.lastWords = '',
    this.isListening = false,
    this.isSpeechEnabled = true,
  });
}

final speechProvider = StateNotifierProvider<SpeechNotifier, SpeechState>(
  (ref) => SpeechNotifier(),
);

class VoiceScreen extends ConsumerWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speechState = ref.watch(speechProvider);
    final messages = ref.watch(messageListProvider);
    final message = (messages.length % 2 == 0) ? null : messages.last;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  speechState.lastWords,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 160),
              IconButton(
                icon: const Icon(
                  Icons.mic_rounded,
                  size: 100,
                ),
                onPressed: speechState.isSpeechEnabled
                    ? () {
                        if (speechState.isListening) {
                          ref.read(speechProvider.notifier).stopListening();
                        } else {
                          ref
                              .read(speechProvider.notifier)
                              .startListening(ref, context);
                        }
                      }
                    : null,
              ),
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  message != null ? message.text : '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
