import 'package:alura_bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// use "async" na funcao para falar que eh uma funcao asincrona, assim podendo usar o "await"
// await usado para esperar a resposta de uma future acontecer para entao retonar o seu valor
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('''CREATE TABLE contacts(
            id INTEGER PRIMARY KEY,
            name TEXT,
            accont_number INTEGER
            )''');
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

Future<int> saveContact(Contact contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  // contactMap['id'] = contact.id; Caso nao incremente o id, o sqflite incrementa sozinho
  contactMap['name'] = contact.name;
  contactMap['accont_number'] = contact.accountNumber;
  return db.insert('contacts', contactMap);

  // return getDatabase().then((db) {
  //   final Map<String, dynamic> contactMap = Map();
  //   // contactMap['id'] = contact.id; Caso nao incremente o id, o sqflite incrementa sozinho
  //   contactMap['name'] = contact.name;
  //   contactMap['accont_number'] = contact.accountNumber;
  //   return db.insert('contacts', contactMap);
  // });
}

Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> listContacts = List();
  for (Map<String, dynamic> el in result) {
    final Contact contact = Contact(
      el['id'],
      el['name'],
      el['accont_number'],
    );
    listContacts.add(contact);
  }
  return listContacts;

  // return getDatabase().then((db) {
  //   return db.query('contacts').then((maps) {
  //     final List<Contact> listContacts = List();
  //     for (Map<String, dynamic> el in maps) {
  //       final Contact contact =
  //           Contact(el['id'], el['name'], el['accont_number']);
  //       listContacts.add(contact);
  //     }
  //     return listContacts;
  //   });
  // });
}
