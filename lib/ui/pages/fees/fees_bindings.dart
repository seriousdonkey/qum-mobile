import 'package:get/get.dart';
import 'package:qum/domain/use_cases/get_fees.dart';
import 'package:qum/ui/pages/fees/fees_controller.dart';

class FeesBindings extends Bindings {
  @override
  void dependencies() {
    final getFeesUseCase = Get.find<GetFeesUseCase>();
    Get.lazyPut(
      () => FeesController(getFeesUseCase),
    );
  }
}
