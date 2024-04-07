import 'package:flutter/material.dart';

makeThreadId() {
  DateTime now = DateTime.now();
  String threadId = '${now.year}'
      '${now.month.toString().padLeft(2, '0')}'
      '${now.day.toString().padLeft(2, '0')}'
      '${now.hour.toString().padLeft(2, '0')}'
      '${now.minute.toString().padLeft(2, '0')}'
      '${now.second.toString().padLeft(2, '0')}';
  debugPrint('スレッドID: $threadId');
  return threadId;
}
