import 'package:flutter/material.dart';

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
          color: Theme.of(context).colorScheme.primaryContainer,
          // border: Border.all(
          //     color: Theme.of(context).colorScheme.onTertiaryContainer,
          //     width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
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
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 38.0),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
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

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 38.0),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                "Loading...",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
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
