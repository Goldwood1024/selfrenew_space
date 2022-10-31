import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitRepository {
  static String tableName = 'habit';
  static String ddl = '''
create table if not exists $tableName
(
    id          INTEGER
        PRIMARY KEY AUTOINCREMENT,
    title       TEXT NOT NULL,
);
  ''';

  static String delete = '''
delete from $tableName;
 ''';

  static String selectAll = '''
select * from $tableName
 ''';

  Future<void> createTableAndDefaultValue(Database database) async {
    await database.execute(ddl);
  }

  Future<List<Map<String, Object?>>> query() async {
    return await SqliteProxy.database.rawQuery(selectAll);
  }

  Future<void> update(String col, String value) async {
    String sql = 'update $tableName set $col=\'$value\'';
    await SqliteProxy.database.rawUpdate(sql);
  }
}
