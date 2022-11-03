import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitRepository {
  static String habitTableName = 'habit';
  static String ddl = '''
create table if not exists $habitTableName
(
    id        INTEGER
        PRIMARY KEY AUTOINCREMENT,
    title     TEXT    NOT NULL,           -- 标题
    icon      TEXT    NOT NULL,           -- 图标地址
    color     TEXT    NOT NULL,           -- 颜色
    isAbandon INTEGER          default 0, -- 是否放弃 1: 已放弃 0: 有效
    startDate TEXT    NOT NULL,           -- 开始日期
    hearten   TEXT    NOT NULL,           -- 鼓励语
    max       INTEGER NOT NULL default 1, -- 最大值
    min       INTEGER NOT NULL default 0,
    isDeleted INTEGER NOT NULL default 0,
    gmtDate   TEXT    NOT NULL
);
  ''';

  static String delete = '''
delete from $habitTableName;
 ''';

  static String selectAll = '''
select * from $habitTableName where isDeleted=0
 ''';

  Future<void> createTableAndDefaultValue(Database database) async {
    await database.execute(ddl);
  }

  Future<List<Map<String, Object?>>> query() async {
    return await SqliteProxy.database.rawQuery(selectAll);
  }

  Future<void> update(String col, String value, String id) async {
    String sql = 'update $habitTableName set $col=\'$value\' where id=$id';
    await SqliteProxy.database.rawUpdate(sql);
  }

  Future<void> insertHabit(Map<String, Object?> values) async {
    await SqliteProxy.database.insert(habitTableName, values);
  }
}
