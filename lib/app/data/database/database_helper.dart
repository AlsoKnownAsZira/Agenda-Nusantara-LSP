import 'dart:convert';
import 'package:crypto/crypto.dart';
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

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tugas (
        id        INTEGER PRIMARY KEY AUTOINCREMENT,
        judul     TEXT NOT NULL,
        deskripsi TEXT,
        tanggal   TEXT NOT NULL,
        kategori  TEXT NOT NULL,
        selesai      INTEGER DEFAULT 0,
        completed_at TEXT
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
      'password': _hashPassword('user'),
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
    final completedAt = selesai == 1
        ? DateTime.now().toIso8601String().substring(0, 10)
        : null;
    return await db.update(
      'tugas',
      {'selesai': selesai, 'completed_at': completedAt},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, int>> getTugasSummary() async {
    final db = await database;

    final selesai =
        Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM tugas WHERE selesai = 1'),
        ) ??
        0;

    final belumSelesai =
        Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM tugas WHERE selesai = 0'),
        ) ??
        0;

    return {'selesai': selesai, 'belumSelesai': belumSelesai};
  }

  Future<List<Map<String, dynamic>>> getTugasPerHari() async {
    final db = await database;
    return await db.rawQuery('''
      SELECT completed_at as tanggal, COUNT(*) as jumlah
      FROM tugas
      WHERE selesai = 1 AND completed_at IS NOT NULL
      GROUP BY completed_at
      ORDER BY completed_at ASC
    ''');
  }

  // ─── PENGATURAN ──────────────────────────────────────

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }

  Future<bool> login(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'pengaturan',
      where: 'username = ? AND password = ?',
      whereArgs: [username, _hashPassword(password)],
    );
    return result.isNotEmpty;
  }

  Future<bool> verifyPassword(String password) async {
    final db = await database;
    final result = await db.query('pengaturan', where: 'id = 1');
    if (result.isEmpty) return false;
    return result.first['password'] == _hashPassword(password);
  }

  Future<int> updatePassword(String passwordBaru) async {
    final db = await database;
    return await db.update(
      'pengaturan',
      {'password': _hashPassword(passwordBaru)},
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}
