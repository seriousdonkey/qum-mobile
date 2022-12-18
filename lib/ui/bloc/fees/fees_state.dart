import 'package:qum/domain/entities/fee.dart';

abstract class FeesState {
  final List<Fee> fees = [];
}

class FeesEmpty extends FeesState {}

class FeesLoading extends FeesState {}

class FeesHasData extends FeesState {
  FeesHasData(List<Fee> fees) {
    super.fees.addAll(fees);
  }
}
