import 'package:get/get.dart';
import 'package:qum/database.dart';
import 'package:qum/domain/use_cases/get_fees.dart';
import 'package:qum/ui/widgets/navigation_bar/navigation_bar_controller.dart';

import 'data/repositories/fee_repository_impl.dart';
import 'domain/repositories/fee_repository.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(QumNavigationBarController());

    initDatabase().then((db) {
      final feesRepository = Get.put<FeeRepository>(
          FeeRepositoryImpl(database: db),
          permanent: true);
      Get.put(GetFeesUseCase(feesRepository), permanent: true);
    });
  }
}
