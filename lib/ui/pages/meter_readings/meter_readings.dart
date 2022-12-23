import 'package:flutter/material.dart';
import 'package:qum/ui/widgets/navigation_bar/navigation_bar.dart';

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
      bottomNavigationBar: const QumNavigationBar(),
    );
  }
}
