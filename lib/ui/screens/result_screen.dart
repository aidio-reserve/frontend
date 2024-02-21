import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;

  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(result);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホテル情報'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Text(result),
          ),
        ),
      ),
    );
  }
}
