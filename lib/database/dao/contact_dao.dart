import 'package:flutter_feature_flag_2/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_feature_flag_2/database/app_database.dart';

/*
class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_accountNumber INTEGER PRIMARY KEY,'
      '$_name TEXT)';

  static const String _tableName = 'contacts';
  static const String _accountNumber = 'account_number';
  static const String _name = 'name';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_accountNumber] = contact.accountNumber;
    contactMap[_name] = contact.name;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(row[_name], row[_accountNumber]);
      contacts.add(contact);
    }
    return contacts;
  }
}
*/

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_accountNumber INTEGER PRIMARY KEY,'
      '$_name TEXT,'
      '$_surname TEXT)';

  static const String addSurnameColumnSql = 'ALTER TABLE $_tableName ADD $_surname TEXT';

  static const String _tableName = 'contacts';
  static const String _accountNumber = 'account_number';
  static const String _name = 'name';
  static const String _surname = 'surname';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_accountNumber] = contact.accountNumber;
    contactMap[_name] = contact.name;
    contactMap[_surname] = contact.surname;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(name: row[_name], accountNumber: row[_accountNumber], surname: row[_surname]);
      contacts.add(contact);
    }
    return contacts;
  }
}
