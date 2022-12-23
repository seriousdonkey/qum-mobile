import 'package:get/get.dart';
import 'package:qum/ui/pages/dashboard/dashboard.dart';
import 'package:qum/ui/pages/fees/fees_bindings.dart';
import 'package:qum/ui/pages/fees/fees_page.dart';
import 'package:qum/ui/pages/meter_readings/meter_readings.dart';
import 'package:qum/ui/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const Dashboard(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.METER_READINGS,
      page: () => const MeterReadings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.FEES,
      page: () => const FeesPage(),
      binding: FeesBindings(),
      transition: Transition.noTransition,
    ),
  ];
}
