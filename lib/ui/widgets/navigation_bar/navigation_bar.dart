import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qum/ui/widgets/navigation_bar/navigation_bar_controller.dart';

class QumNavigationBar extends StatelessWidget {
  const QumNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QumNavigationBarController>();
    return BottomNavigationBar(
      currentIndex: controller.tabIndex,
      onTap: (idx) {
        controller.changeTab(idx);
        Get.offNamed(controller.routes[idx]);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(
            icon: Icon(Icons.table_view), label: 'Zählerstand'),
        BottomNavigationBarItem(
            icon: Icon(Icons.description), label: 'Gebühren'),
      ],
    );
  }
}
