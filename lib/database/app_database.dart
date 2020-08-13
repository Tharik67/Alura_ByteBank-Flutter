import 'package:alura_bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
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
  });
}

Future<int> saveContact(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    // contactMap['id'] = contact.id; Caso nao incremente o id, o sqlfite incrementa sozinho
    contactMap['name'] = contact.name;
    contactMap['accont_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> listContacts = List();
      for (Map<String, dynamic> el in maps) {
        final Contact contact =
            Contact(el['id'], el['name'], el['accont_number']);
        listContacts.add(contact);
      }
      return listContacts;
    });
  });
}
