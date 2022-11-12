import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitRepository {
  static String habitTableName = 'habit';

  /// 建表语句
  static String ddl = '''
create table if not exists $habitTableName
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,        -- 主键
    title     TEXT    NOT NULL,           -- 标题
    icons     TEXT    NOT NULL,           -- 图标
    repeat    TEXT    NOT NULL,           -- 重复
    target    TEXT    NOT NULL,           --目标
    remind    TEXT    NOT NULL,           -- 提醒
    hearten   TEXT    NOT NULL,           -- 鼓励语
    isAbandon INTEGER          default 0, -- 是否放弃 1: 已放弃 0: 有效
    startDate TEXT    NOT NULL,           -- 开始日期
    isDeleted INTEGER NOT NULL default 0, -- 是否删除 1: 删除
    gmtDate   TEXT    NOT NULL            -- 创建日期
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

  Future<Map<String, Object?>> selectById(String id) async {
    String sql = 'select * from $habitTableName where isDeleted=0 and id= $id';
    List<Map<String, Object?>> list = await SqliteProxy.database.rawQuery(sql);
    if (list.isNotEmpty) {
      return list[0];
    }

    return {};
  }

  Future<void> update(String col, String value, String id) async {
    String sql = 'update $habitTableName set $col=\'$value\' where id=$id';
    await SqliteProxy.database.rawUpdate(sql);
  }

  Future<void> updateById(Map<String, Object?> values, String id) async {
    String sql = '''
    update $habitTableName set title='${values['title']}', 
    icons='${values['icons']}', 
    repeat='${values['repeat']}', 
    target='${values['target']}', 
    remind='${values['remind']}', 
    startDate='${values['startDate']}',
    hearten='${values['hearten']}'
    where id=$id
    ''';

    await SqliteProxy.database.rawUpdate(sql);
  }

  Future<void> insertHabit(Map<String, Object?> values) async {
    await SqliteProxy.database.insert(habitTableName, values);
  }
}
