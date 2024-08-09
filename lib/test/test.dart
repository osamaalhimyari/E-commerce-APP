import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('for test'),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: const [],
          )),
    );
  }
}
