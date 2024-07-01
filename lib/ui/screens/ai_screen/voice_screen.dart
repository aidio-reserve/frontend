import 'package:aitrip/providers/loading_provider.dart';
import 'package:aitrip/providers/message_list_provider.dart';
import 'package:aitrip/providers/speech_notifier_provider.dart';
import 'package:aitrip/ui/components/voice_container.dart';
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
    this.isSpeechEnabled = false,
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
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (Widget child, Animation<double> animation) {
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
                            key: const ValueKey('user'), //Keyを指定
                            text: speechState.lastWords,
                          )
                        : ServerContainer(
                            key: const ValueKey('server'), //Keyを指定
                            text: message != null ? message.text : '',
                          ),
              ),
              const SizedBox(height: 20),
              Column(
                children: <Widget>[
                  const Text("開発用"),
                  ServerContainer(
                    text: message != null ? message.text : '',
                  ),
                  const SizedBox(height: 20),
                  UserContainer(
                    text: speechState.lastWords,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              IconButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
