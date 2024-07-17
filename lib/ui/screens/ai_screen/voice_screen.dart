import 'package:aitrip/providers/loading_provider.dart';
import 'package:aitrip/providers/message_list_provider.dart';
import 'package:aitrip/providers/speech_notifier_provider.dart';
import 'package:aitrip/ui/components/voice_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:wavenet/wavenet.dart';
import 'package:audioplayers/audioplayers.dart';

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

class VoiceScreen extends ConsumerStatefulWidget {
  const VoiceScreen({super.key});

  @override
  VoiceScreenState createState() => VoiceScreenState();
}

class VoiceScreenState extends ConsumerState<VoiceScreen> {
  late TextToSpeechService ttsService; //late:初期化されることを約束するもの
  final AudioPlayer audioPlayer = AudioPlayer();
  String? lastSpokenMessage;

  @override
  void initState() {
    super.initState();
    final speechId = dotenv.env['TEXT_TO_SPEECH_API_KEY'];
    if (speechId == null || speechId.isEmpty) {
      throw Exception('TEXT_TO_SPEECH_API_KEY is not defined in .env file');
    }
    ttsService = TextToSpeechService(speechId);
  }

  @override
  Widget build(BuildContext context) {
    final speechState = ref.watch(speechProvider);
    final messages = ref.watch(messageListProvider);
    final message = (messages.length % 2 == 0) ? null : messages.last;

    Future<void> _speak(String text) async {
      try {
        // Text to Speech変換
        File mp3 = await ttsService.textToSpeech(
          text: text,
          voiceName: 'ja-JP-Wavenet-B',
          audioEncoding: 'MP3',
          languageCode: 'ja-JP',
          pitch: 0.0,
          speakingRate: 1.0,
        );
        // 再生
        await audioPlayer.play(DeviceFileSource(mp3.path));
      } catch (e) {
        debugPrint('Error: $e');
      }
    }

    // messageが更新された場合のみ読み上げる
    if (message != null && message.text != lastSpokenMessage) {
      lastSpokenMessage = message.text;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _speak(message.text);
      });
    }

    final isLoading = ref.watch(isLoadingProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .inverseSurface
                      .withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeOut,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          // フェードインとスライドインのアニメーションを組み合わせる
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.5),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        //声を聞き取っている場合、ServerContainerを表示、そうでない場合はUserContainerを表示
                        child: isLoading
                            ? const LoadingContainer()
                            : speechState.isListening
                                ? UserContainer(
                                    key: const ValueKey('user'),
                                    text: speechState.lastWords,
                                  )
                                : ServerContainer(
                                    key: const ValueKey('server'),
                                    text: message != null ? message.text : '',
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .inverseSurface
                        .withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "宿泊先：",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "日程：",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "人数：",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "値段帯：",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "部屋のサイズ：",
                            style: TextStyle(fontSize: 16),
                          ),
                          // SizedBox(height: 8),
                          // Text(
                          //   "ベッドサイズ：",
                          //   style: TextStyle(fontSize: 16),
                          // ),
                          // SizedBox(height: 8),
                          // Text(
                          //   "ベッドの種類：",
                          //   style: TextStyle(fontSize: 16),
                          // ),
                        ],
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: const Icon(
                    Icons.mic_rounded,
                    size: 40,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
