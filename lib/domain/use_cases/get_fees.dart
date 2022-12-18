import 'package:qum/domain/entities/fee.dart';
import 'package:qum/domain/repositories/fee_repository.dart';

class GetFeesUseCase {
  final FeeRepository _feeRepository;

  GetFeesUseCase(this._feeRepository);

  Future<List<Fee>> execute() {
    return _feeRepository.getFees();
  }
}
