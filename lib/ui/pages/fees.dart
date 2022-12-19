import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qum/domain/entities/fee.dart';
import 'package:qum/ui/bloc/fees/fees_bloc.dart';
import 'package:qum/ui/bloc/fees/fees_events.dart';
import 'package:qum/ui/bloc/fees/fees_state.dart';

class Fees extends StatelessWidget {
  const Fees({super.key});

  void createFee(BuildContext context) {
    Fee fee = Fee(
      baseFee: 100.0,
      pricePerUnit: 1.5,
      monthlyDiscount: 30.0,
      dateStart: DateTime.now().subtract(Duration(days: 155)),
      dateEnd: DateTime.now(),
    );
    context.read<FeesBloc>().add(CreateFee(fee));
  }

  @override
  Widget build(BuildContext context) {
    context.read<FeesBloc>().add(LoadFees());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gebühren'),
      ),
      body: Center(
        child: BlocBuilder<FeesBloc, FeesState>(
          builder: (ctx, state) {
            if (state is FeesLoading) {
              return const Text('Loading...');
            } else if (state is FeesHasData) {
              return Center(
                child: Text('Count: ${state.fees.length}'),
              );
            }

            return const Text('No Data');
          },
        ),
      ),
    );
  }
}
