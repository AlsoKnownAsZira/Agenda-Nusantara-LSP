import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/tugas_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('agenda.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tugas (
        id        INTEGER PRIMARY KEY AUTOINCREMENT,
        judul     TEXT NOT NULL,
        deskripsi TEXT,
        tanggal   TEXT NOT NULL,
        kategori  TEXT NOT NULL,
        selesai   INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE pengaturan (
        id       INTEGER PRIMARY KEY,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    await db.insert('pengaturan', {
      'id': 1,
      'username': 'user',
      'password': 'user',
    });
  }

  // ─── TUGAS ───────────────────────────────────────────

  Future<int> insertTugas(TugasModel tugas) async {
    final db = await database;
    return await db.insert('tugas', tugas.toMap());
  }

  Future<List<TugasModel>> getAllTugas() async {
    final db = await database;
    final result = await db.query('tugas', orderBy: 'tanggal ASC');
    return result.map((map) => TugasModel.fromMap(map)).toList();
  }

  Future<int> updateSelesai(int id, int selesai) async {
    final db = await database;
    return await db.update(
      'tugas',
      {'selesai': selesai},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, int>> getTugasSummary() async {
    final db = await database;

    final selesai = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM tugas WHERE selesai = 1'),
    ) ?? 0;

    final belumSelesai = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM tugas WHERE selesai = 0'),
    ) ?? 0;

    return {'selesai': selesai, 'belumSelesai': belumSelesai};
  }

  Future<List<Map<String, dynamic>>> getTugasPerHari() async {
    final db = await database;
    return await db.rawQuery('''
      SELECT tanggal, COUNT(*) as jumlah
      FROM tugas
      WHERE selesai = 1
      GROUP BY tanggal
      ORDER BY tanggal ASC
    ''');
  }

  // ─── PENGATURAN ──────────────────────────────────────

  Future<bool> login(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'pengaturan',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  Future<String?> getPassword() async {
    final db = await database;
    final result = await db.query('pengaturan', where: 'id = 1');
    if (result.isEmpty) return null;
    return result.first['password'] as String;
  }

  Future<int> updatePassword(String passwordBaru) async {
    final db = await database;
    return await db.update(
      'pengaturan',
      {'password': passwordBaru},
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}