import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PengeluaranService{
  // PREPARING THE DATABASE
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'pengeluaran.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, nama_pengeluaran TEXT NOT NULL, nominal_pengeluaran REAL NOT NULL, kategori_pengeluaran TEXT NOT NULL, tanggal_pengeluaran TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  // CREATING THE DATABASE
  Future<void> create(PengeluaranModel pengeluaran) async {
    final Database db = await initDB();
    await db.insert('pengeluaran', pengeluaran.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // READING THE DATABASE
  Future<List<PengeluaranModel>> read() async {
    final Database db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('pengeluaran');

    return List.generate(maps.length, (index) {
      return PengeluaranModel(
        nama_pengeluaran: maps[index]['nama_pengeluaran'],
        nominal_pengeluaran: maps[index]['nominal_pengeluaran'],
        kategori_pengeluaran: maps[index]['kategori_pengeluaran'],
        tanggal_pengeluaran: maps[index]['tanggal_pengeluaran']
      );
    });
  }
}