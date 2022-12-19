import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_migration/sqflite_migration.dart';

final _initialScript = [
  '''
    create table fees ( 
    id integer primary key autoincrement, 
    base_fee real not null,
    price_per_unit real not null,
    monthly_discount real not null,
    date_start integer not null,
    date_end integer not null
    )
  '''
];

final List<String> _migrations = [];
final _config = MigrationConfig(
  initializationScript: _initialScript,
  migrationScripts: _migrations,
);

Future<Database> initDatabase() async {
  const dbPath = 'qum.db';
  return await openDatabaseWithMigration(dbPath, _config);
}
