import 'package:flutter/material.dart';

class MeterReadings extends StatelessWidget {
  const MeterReadings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zählerstand'),
      ),
      body: const Center(
        child: Text('Zählerstand'),
      ),
    );
  }
}
