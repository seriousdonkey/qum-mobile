import 'package:qum/domain/entities/fee.dart';

abstract class FeesEvent {}

class LoadFees extends FeesEvent {}

class CreateFee extends FeesEvent {
  final Fee fee;

  CreateFee(this.fee);
}
