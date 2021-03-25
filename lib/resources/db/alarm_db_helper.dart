import 'dart:io';
import 'package:alarm/data/data.dart';
import 'package:alarm/model/alarm_item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/*
 *  This class uses Singelton pattern to get only one instance 
 *  of the database helper.
 *  the database is declared and initialized here 
 */

class AlarmHelper {
  //constants section
  static final String _dbName = 'alarms.db';
  static final int _dbVersion = 1;

  //table constants
  static final String _tableName = 'alarms';
  static final String _columnId = 'id';
  static final String _columnTitle = 'title';
  static final String _columnDateTime = 'datetime';
  static final String _columnIsActive = 'isactive';
  static final String _columnColorIndex = 'colorindex';

  //define the Helper
  AlarmHelper._createInstance(); //declare the private constructor
  static final AlarmHelper instance = AlarmHelper._createInstance();

  //database declaration
  static Database _database;
  Future<Database> get database async {
    if (_database == null) _database = await _initializeDatabase();

    return _database;
  }

  Future<Database> _initializeDatabase() async {
    //get the path of the database
    Directory dbDriectory = await getApplicationDocumentsDirectory();
    String path = join(dbDriectory.path, _dbName);

    var database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );

    print('Database initialized....');

    return database;
  }

  Future _onCreate(Database db, int version) {
    return db.execute('''
      Create Table $_tableName(
        $_columnId integer not null primary key autoincrement,
        $_columnTitle text not null,
        $_columnDateTime text not null,
        $_columnIsActive integer ,
        $_columnColorIndex integer )
    ''');
  }

  //insert
  Future<int> insert(AlarmItem item) async {
    //get the database
    Database db = await instance.database;
    int index = await db.insert(_tableName, item.toMap());

    print('item inserted in index ($index)');
    return index;
  }

  //delete
  Future<int> update(AlarmItem item) async {
    //get the database
    Database db = await instance.database;
    int count = await db.update(_tableName, item.toMap());

    print('$count items updated...');
    return count;
  }

  Future<int> delete(AlarmItem item) async {
    //get database instance
    Database db = await instance.database;
    int countDeleted =
        await db.delete(_tableName, where: 'id=?', whereArgs: [item.id]);

    print('$countDeleted items deleted successfully... ');
    return countDeleted;
  }

  Future<List<AlarmItem>> getAlarms() async {
    Database db = await instance.database;
    List<AlarmItem> alarms = []; //alarms list

    var items = await db.query(_tableName);
    items.forEach((element) {
      var item = AlarmItem.fromMap(element);
      alarms.add(item);
    });
    
    return alarms;
  }
}
