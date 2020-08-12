import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void creatDatabase() {
  getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    openDatabase(path, onCreate: (db, version) {
      db.execute('''CREATE TABLE contacts(
            id INTEGER PRIMARY KEY,
            name TEXT,
            accont_number INTEGER
            )''');
    }, version: 1);
  });
}
