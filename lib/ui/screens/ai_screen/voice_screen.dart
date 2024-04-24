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

//StateNotifierProviderの<>は、左側には利用したいStateNotifierを、右側には返したい方を指定する。
final speechProvider = StateNotifierProvider<SpeechNotifier, SpeechState>(
  (ref) => SpeechNotifier(),
);

class SpeechNotifier extends StateNotifier<SpeechState> {
  final SpeechToText _speechToText = SpeechToText();

//SpeechNotifierのコンストラクタの作成の際に、
//SpeechStateをインスタンス化することでSpeechNotifierの親クラスであるStateNotifierの初期化を行っており、
//SpeechNotifierクラスが初期化される際に_initSpeechメソッドを呼び出している
  SpeechNotifier() : super(SpeechState()) {
    _initSpeech();
  }

  void _initSpeech() async {
    bool available = await _speechToText.initialize();
    state = state.copyWith(isSpeechEnabled: available);
  }

  void startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      pauseFor: const Duration(seconds: 2),
    );
    state = state.copyWith(isListening: true);
  }

  void stopListening() async {
    await _speechToText.stop();
    state = state.copyWith(isListening: false);
    //messageProviderのsendMessage関数を呼び出す
    // sendMessage();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    state = state.copyWith(lastWords: result.recognizedWords);
  }

  void reset() {
    state = state.copyWith(lastWords: '');
  }
}

// void sendMessage() {
// }

extension SpeechStateCopyWith on SpeechState {
  SpeechState copyWith({
    //下の？はnull許容型
    String? lastWords,
    bool? isListening,
    bool? isSpeechEnabled,
  }) {
    return SpeechState(
      //下の？？はnull許容型演算子
      lastWords: lastWords ?? this.lastWords,
      isListening: isListening ?? this.isListening,
      isSpeechEnabled: isSpeechEnabled ?? this.isSpeechEnabled,
    );
  }
}

class VoiceScreen extends ConsumerWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speechState = ref.watch(speechProvider);
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
                          ref.read(speechProvider.notifier).startListening();
                        }
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
