import 'package:get_it/get_it.dart';
import 'package:qum/data/repositories/fee_repository_impl.dart';
import 'package:qum/domain/repositories/fee_repository.dart';
import 'package:qum/ui/bloc/fees/fees_bloc.dart';
import 'package:sqflite/sqflite.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => FeesBloc(locator()));

  locator.registerSingletonAsync<FeeRepository>(() async {
    Database database = await openDatabase(
      'qum.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          create table fees ( 
            id integer primary key autoincrement, 
            base_fee real not null,
            price_per_unit real not null,
            monthly_discount real not null)
        ''');
      },
    );

    return FeeRepositoryImpl(database: database);
  });
}
