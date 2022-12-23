import 'package:flutter/material.dart';
import 'package:qum/ui/widgets/navigation_bar/navigation_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Center(child: Text('Dashboard')),
      bottomNavigationBar: const QumNavigationBar(),
    );
  }
}
