import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qum/domain/repositories/fee_repository.dart';
import 'package:qum/ui/bloc/fees/fees_events.dart';
import 'package:qum/ui/bloc/fees/fees_state.dart';

class FeesBloc extends Bloc<FeesEvent, FeesState> {
  final FeeRepository feeRepository;

  FeesBloc(this.feeRepository) : super(FeesEmpty()) {
    on<LoadFees>((event, emit) async {
      emit(FeesLoading());

      final fees = await feeRepository.getFees();
      emit(FeesHasData(fees));
    });
    on<CreateFee>((event, emit) async {
      await feeRepository.createFee(event.fee);
    });
  }
}
