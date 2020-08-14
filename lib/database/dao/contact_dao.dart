import 'package:alura_bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao {
  static const String tableSql = '''CREATE TABLE $_tableName(
            $_id INTEGER PRIMARY KEY,
            $_name TEXT,
            $_accountNumber INTEGER
            )''';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'accont_number';

  Future<int> saveContact(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);

    // return getDatabase().then((db) {
    //   final Map<String, dynamic> contactMap = Map();
    //   // contactMap['id'] = contact.id; Caso nao incremente o id, o sqflite incrementa sozinho
    //   contactMap['name'] = contact.name;
    //   contactMap['accont_number'] = contact.accountNumber;
    //   return db.insert('contacts', contactMap);
    // });
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    // contactMap['id'] = contact.id; Caso nao incremente o id, o sqflite incrementa sozinho
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> listContacts = _toList(result);
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

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> listContacts = List();
    for (Map<String, dynamic> el in result) {
      final Contact contact = Contact(
        el[_id],
        el[_name],
        el[_accountNumber],
      );
      listContacts.add(contact);
    }
    return listContacts;
  }
}
