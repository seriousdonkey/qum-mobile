import 'package:get/get.dart';
import 'package:qum/ui/routes/app_routes.dart';

class QumNavigationBarController extends GetxController {
  final routes = <String>[
    AppRoutes.DASHBOARD,
    AppRoutes.METER_READINGS,
    AppRoutes.FEES
  ];

  var tabIndex = 0;

  void changeTab(int idx) {
    tabIndex = idx;
    update();
  }
}
