import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:countskan/model/meter.dart';

class MeterDatabase {
  static final MeterDatabase instance = MeterDatabase._init();

  static Database? _database;

  MeterDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('meter_reading.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const meterType = 'INTEGER';
    const dateType = 'TEXT';

    await db.execute('''
CREATE TABLE $tableMeter ( 
  ${MeterFields.id} $idType, 
  ${MeterFields.hotWater} $meterType,
  ${MeterFields.coldWater} $meterType,
  ${MeterFields.electricity} $meterType,
  ${MeterFields.date} $dateType
  )
''');
  }

  Future<Meter> create(Meter meter) async {
    final db = await instance.database;

    final id = await db.insert(tableMeter, meter.toJson());
    return meter.copy(id: id);
  }

  Future<Meter> readMeter(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableMeter,
      columns: MeterFields.values,
      where: '${MeterFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Meter.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Meter>> readAllMeter() async {
    final db = await instance.database;

    const orderBy = '${MeterFields.date} ASC';

    final result = await db.query(tableMeter, orderBy: orderBy);

    return result.map((json) => Meter.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableMeter,
      where: '${MeterFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
