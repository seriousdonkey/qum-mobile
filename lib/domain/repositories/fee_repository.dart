import 'package:qum/domain/entities/fee.dart';

abstract class FeeRepository {
  Future<List<Fee>> getFees();
  Future<Fee> createFee(Fee fee);
}
