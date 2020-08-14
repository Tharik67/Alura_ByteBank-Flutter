import 'package:alura_bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// use "async" na funcao para falar que eh uma funcao asincrona, assim podendo usar o "await"
// await usado para esperar a resposta de uma future acontecer para entao retonar o seu valor
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
    // Apaga os dados do banco
  );
  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) {
  //       db.execute('''CREATE TABLE contacts(
  //           id INTEGER PRIMARY KEY,
  //           name TEXT,
  //           accont_number INTEGER
  //           )''');
  //     },
  //     version: 1,
  //     // onDowngrade: onDatabaseDowngradeDelete,
  //     // Apaga os dados do banco
  //   );
  // });
}
