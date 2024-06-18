import 'package:aitrip/models/messages.dart';
import 'package:aitrip/providers/speech_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechState {
  final String lastWords;
  final bool isListening;
  final bool isSpeechEnabled;

  //コンストラクタ
  SpeechState({
    this.lastWords = '',
    this.isListening = false,
    this.isSpeechEnabled = false,
  });
}

final speechProvider = StateNotifierProvider<SpeechNotifier, SpeechState>(
  (ref) => SpeechNotifier(),
);

class VoiceScreen extends ConsumerStatefulWidget {
  const VoiceScreen({super.key});  

  @override
  VoiceScreenState createState() => VoiceScreenState();
}


class VoiceScreenState extends ConsumerState<VoiceScreen> {
  late FlutterTts flutterTts;
  String? lastSpokenMessage;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _setTtsLanguage();
    flutterTts.setVolume(0.5); //声の大きさ（0.0-1.0）
    flutterTts.setSpeechRate(1.0); //発話速度（0.0-1.0）
    flutterTts.setPitch(0.8); //声の高さ（0.5-2.0）
  }

  Future<void> _setTtsLanguage() async {
    await flutterTts.setLanguage("ja-JP"); //読み上げ言語を日本語に設定
  }

  Future<void> _speak(String text) async {
    await flutterTts.stop();
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final speechState = ref.watch(speechProvider);
    final messages = ref.watch(messageListProvider);
    final message = (messages.length % 2 == 0) ? null : messages.last;

    // messageが更新された場合のみ読み上げる
   if (message != null && message.text != lastSpokenMessage) {
      lastSpokenMessage = message.text;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _speak(message.text);
      });
    }

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
