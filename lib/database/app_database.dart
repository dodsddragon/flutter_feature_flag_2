import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_feature_flag_1/database/dao/contact_dao.dart';

Future<Database> getDatabase() async {
  return openDatabase(join(await getDatabasesPath(), 'feature_flag_1.db'),
      onCreate: (db, version) {
        db.execute(ContactDao.tableSql);
      },
      version: 2,
      //onDowngrade: onDatabaseDowngradeDelete,
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(ContactDao.addSurnameColumnSql);
      });
}
