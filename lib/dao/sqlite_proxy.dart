import 'package:path/path.dart';
import 'package:selfrenew_space/dao/app_setting/repository.dart';
import 'package:selfrenew_space/dao/focus/repository.dart';
import 'package:selfrenew_space/dao/habit/repository.dart';
import 'package:sqflite/sqflite.dart';

/// sqlite 代理
class SqliteProxy {
  static late Database database;
  static final Repository appSettingRepository = Repository();
  static final HabitRepository habitRepository = HabitRepository();
  static final FocusRepository focusRepository = FocusRepository();

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
        await habitRepository.createTableAndDefaultValue(db);
        await habitRepository.createTableAndDefaultValue(db);
        await focusRepository.createTableAndDefaultValue(db);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onOpen: (Database db) {},
    );

    // if (database.isOpen) {
    //   print(database.path);
    //   // await appSettingRepository.createTableAndDefaultValue(database);
    //   print(await appSettingRepository.query());
    // }
  }
}
