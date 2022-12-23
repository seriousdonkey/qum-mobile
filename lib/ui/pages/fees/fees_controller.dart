import 'package:get/get.dart';
import 'package:qum/domain/entities/fee.dart';
import 'package:qum/domain/use_cases/get_fees.dart';

class FeesController extends GetxController {
  final GetFeesUseCase getFeesUseCase;

  final numberOfFees = 0.obs;

  FeesController(this.getFeesUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchFees();
  }

  void fetchFees() async {
    final fees = await getFeesUseCase.execute();
    print("Found ${fees.length} fees!");
    numberOfFees.value = fees.length;
    for (Fee fee in fees) {
      print("Base Fee: ${fee.baseFee}");
    }
  }
}
