import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class PillsDatabase{

  setDatabase() async{
    String databasePath= await getDatabasesPath();
    String path = join(databasePath,"pills_db");
    Database database = await openDatabase(path,version: 1,onCreate: (Database db,int version)async{
      await db.execute("Create Table Pills (id Integer Primary Key, name Text, amount Text, type TEXT, howManyWeeks INTEGER, medicineForm TEXT, time INTEGER, notifyId INTEGER)");
    });
    return database;
  }
}