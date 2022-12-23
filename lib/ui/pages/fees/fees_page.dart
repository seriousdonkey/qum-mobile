import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qum/ui/pages/fees/fees_controller.dart';
import 'package:qum/ui/widgets/navigation_bar/navigation_bar.dart';

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeesController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gebühren'),
      ),
      body: Center(
        child: Obx(() => Text('Found ${controller.numberOfFees} fees!')),
      ),
      bottomNavigationBar: const QumNavigationBar(),
    );
  }
}
