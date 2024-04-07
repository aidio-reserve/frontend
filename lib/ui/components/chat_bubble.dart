import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

Widget userRow(BuildContext context, String message) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: ChatBubble(
            clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 20),
            backGroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Text(
              message,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Icon(
        Icons.face_rounded,
        size: 30,
      ),
    ],
  );
}

Widget serverRow(BuildContext context, String message) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Icon(
        Icons.support_agent_rounded,
        size: 30,
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(right: 38.0),
          child: ChatBubble(
            clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
            margin: const EdgeInsets.only(top: 20),
            backGroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            child: Text(
              message,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget loadingMessageRow(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Icon(
        Icons.support_agent_rounded,
        size: 30,
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(right: 38.0),
          child: SizedBox(
            width: 250,
            height: 150,
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
              margin: const EdgeInsets.only(top: 20),
              backGroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget initialRow(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Icon(
        Icons.support_agent_rounded,
        size: 30,
      ),
      const SizedBox(width: 8),
      ChatBubble(
        clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
        backGroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        child: Text(
          'こんにちは！どこに旅行に行きたいですか？',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
      ),
    ],
  );
}
