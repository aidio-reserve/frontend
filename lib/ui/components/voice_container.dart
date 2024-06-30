import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class UserContainer extends StatelessWidget {
  final String text;

  const UserContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(width: 8),
      const Icon(Icons.face_rounded, size: 30),
    ]);
  }
}

class ServerContainer extends StatelessWidget {
  final String text;

  const ServerContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
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
                text,
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
}
