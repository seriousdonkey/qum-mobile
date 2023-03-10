import 'package:qum/domain/entities/fee.dart';
import 'package:qum/domain/repositories/fee_repository.dart';
import 'package:sqflite/sqlite_api.dart';

const String _tableName = 'fees';
const String _columnId = 'id';
const String _columnBaseFee = 'base_fee';
const String _columnPricePerUnit = 'price_per_unit';
const String _columnMonthlyDiscount = 'monthly_discount';
const String _columnDateStart = 'date_start';
const String _columnDateEnd = 'date_end';

extension FeeExtensions on Fee {
  static Fee fromMap(Map<String, Object?> map) {
    return Fee(
      baseFee: map['base_fee'] as double,
      pricePerUnit: map['price_per_unit'] as double,
      monthlyDiscount: map['monthly_discount'] as double,
      dateStart: DateTime.fromMillisecondsSinceEpoch(map['date_start'] as int),
      dateEnd: DateTime.fromMillisecondsSinceEpoch(map['date_end'] as int),
    );
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      _columnBaseFee: baseFee,
      _columnPricePerUnit: pricePerUnit,
      _columnMonthlyDiscount: monthlyDiscount,
      _columnDateStart: dateStart.millisecondsSinceEpoch,
      _columnDateEnd: dateEnd.millisecondsSinceEpoch,
    };

    if (id != null) {
      map[_columnId] = id;
    }

    return map;
  }
}

class FeeRepositoryImpl implements FeeRepository {
  final Database database;

  FeeRepositoryImpl({required this.database});

  @override
  Future<List<Fee>> getFees() async {
    List<Map<String, Object?>> maps =
        await database.query(_tableName, columns: [
      _columnId,
      _columnBaseFee,
      _columnPricePerUnit,
      _columnMonthlyDiscount,
      _columnDateStart,
      _columnDateEnd,
    ]);

    List<Fee> fees = [];
    for (var map in maps) {
      fees.add(FeeExtensions.fromMap(map));
    }

    return fees;
  }

  @override
  Future<Fee> createFee(Fee fee) async {
    fee.id = await database.insert(_tableName, fee.toMap());
    return fee;
  }
}
