import 'package:path/path.dart';
import 'package:selfrenew_space/dao/app_setting/repository.dart';
import 'package:sqflite/sqflite.dart';

/// sqlite 代理
class SqliteProxy {
  static late Database database;
  static final Repository appSettingRepository = Repository();

  static Future<String> getPath() async {
    var databasesPath = await getDatabasesPath();
    return join(databasesPath, 'demo.sqflite');
  }

  static Future<void> openLocalDatabase() async {
    String path = await getPath();
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await appSettingRepository.createTableAndDefaultValue(db);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onOpen: (Database db) {
        print(db.toString());
      },
    );

    if (database.isOpen) {
      print(database.path);
      // await appSettingRepository.createTableAndDefaultValue(database);
      print(await appSettingRepository.query());
    }
  }
}
