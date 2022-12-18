import 'package:qum/domain/entities/fee.dart';
import 'package:qum/domain/repositories/fee_repository.dart';

class CreateFeeUseCase {
  final FeeRepository _feeRepository;

  CreateFeeUseCase(this._feeRepository);

  Future execute(Fee fee) async {
    _feeRepository.createFee(fee);
  }
}
