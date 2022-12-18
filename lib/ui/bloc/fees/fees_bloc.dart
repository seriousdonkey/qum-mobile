import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qum/domain/use_cases/create_fee.dart';
import 'package:qum/domain/use_cases/get_fees.dart';
import 'package:qum/ui/bloc/fees/fees_events.dart';
import 'package:qum/ui/bloc/fees/fees_state.dart';

class FeesBloc extends Bloc<FeesEvent, FeesState> {
  final GetFeesUseCase _getFees;
  final CreateFeeUseCase _createFee;

  FeesBloc(this._getFees, this._createFee) : super(FeesEmpty()) {
    on<LoadFees>((event, emit) async {
      emit(FeesLoading());

      final fees = await _getFees.execute();
      emit(FeesHasData(fees));
    });
    on<CreateFee>((event, emit) async {
      await _createFee.execute(event.fee);
    });
  }
}
