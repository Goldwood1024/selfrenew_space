import 'package:selfrenew_space/selfrenew_flutter.dart';

class Repository {
  static String tableName = 'app_setting';
  static String ddl = '''
create table if not exists $tableName
(
    id          INTEGER
        PRIMARY KEY AUTOINCREMENT,
    theme       TEXT NOT NULL,
    accentColor TEXT NOT NULL
);
  ''';

  static String defaultValues = '''
insert into $tableName(theme, accentColor)
VALUES ('light', '#165DFF');
  ''';

  static String delete = '''
delete from $tableName;
 ''';

  static String selectAll = '''
select * from $tableName limit 1
 ''';

  Future<void> createTableAndDefaultValue(Database database) async {
    await database.execute(ddl);
    await database.execute(delete);
    await database.execute(defaultValues);
  }

  Future<Map<String, Object?>> query() async {
    List<Map<String, Object?>> list =
        await SqliteProxy.database.rawQuery(selectAll);
    return list.first;
  }

  Future<void> update(String col, String value) async {
    String sql = 'update $tableName set $col=\'$value\'';
    await SqliteProxy.database.rawUpdate(sql);
  }
}
