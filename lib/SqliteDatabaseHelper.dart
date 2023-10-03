import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SqliteDatabaseHelper {
  var databaseName = "Student.db";
  var databaseVersion = 1;

  var tableName = "Signup";
  var id = "id";
  var name = "name";
  var email = "email";
  var contact = "contact";
  var password = "password";

  Database? db = null;
  SqliteDatabaseHelper instance = SqliteDatabaseHelper();

  Future<Database?> get database async{
    if (db!=null) return db;
    db = await initDatabase();
    return db;
  }

  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,databaseName);
    return await openDatabase(path,version: databaseVersion, onCreate:onCreateMathod);
  }

  Future<Database?> onCreateMathod(Database db, int version) async {
    await db.execute(
      '''
           CREATE TABLE $tableName(
            $id AUTOINCREMENT PRIMARY KEY,
            $name TEXT NOT NULL,
            $email TEXT NOT NULL,
            $contact TEXT NOT NULL,
            $password TEXT NOT NULL,
           )
      '''
    );
  }

  Future<int> insertMethod(Map<String,dynamic> rows) async {
     Database? db = await instance.db;
     return await db!.insert(tableName, rows);
  }

  Future<int> updateMethod(Map<String,dynamic> rows, String sContact) async {
     Database? db = await instance.db;
     return await db!.update(tableName, rows, where: '$contact = ?',whereArgs: [sContact]);
  }

  Future<int> deleteMethod(String sContact) async {
     Database? db = await instance.db;
     return await db!.delete(tableName,where: '$contact = ?',whereArgs: [sContact]);
  }

  Future<List<Map<String,dynamic>>> getAllDataMethod() async {
     Database? db = await instance.db;
     return await db!.query(tableName);
  }

  Future<List<Map<String,dynamic>>> getSearchDataMethod(String sContact) async {
     Database? db = await instance.db;
     return await db!.query(tableName, where: '$contact = ?',whereArgs: [sContact]);
  }


}
