import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PengeluaranService {
  // PREPARING THE DATABASE
  Future<Database> initDB() async {
    try {
      String path = await getDatabasesPath();
      return await openDatabase(
        join(path, 'pengeluaran.db'),
        onCreate: (Database database, int version) async {
          await database.execute(
            "CREATE TABLE IF NOT EXISTS pengeluaran (id INTEGER PRIMARY KEY AUTOINCREMENT, nama_pengeluaran TEXT, nominal_pengeluaran REAL, kategori_pengeluaran TEXT, tanggal_pengeluaran TEXT, file_path TEXT)",
          );
        },
        version: 1,
      );
    } catch (e) {
      return throw Exception(e);
    }
  }

  // CREATING THE DATABASE
  Future<void> create(PengeluaranModel pengeluaran) async {
    try {
      final Database db = await initDB();
      await db.insert('pengeluaran', pengeluaran.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print(e);
    }
  }

  // READING THE DATABASE
  Future read() async {
    final Database db = await initDB();
    try {
      final List<Map<String, dynamic>> maps = await db.query('pengeluaran');

      return List.generate(maps.length, (index) {
        return PengeluaranModel(
            nama_pengeluaran: maps[index]['nama_pengeluaran'],
            nominal_pengeluaran: maps[index]['nominal_pengeluaran'],
            kategori_pengeluaran: maps[index]['kategori_pengeluaran'],
            tanggal_pengeluaran: maps[index]['tanggal_pengeluaran'],
            filePath: maps[index]['file_path']);
      });
    } catch (e) {
      print(e);
    }
  }
}