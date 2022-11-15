import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusRepository {
  static String focusTableName = 'focus';
  static String habitClickTableName = 'habit_click';

  /// 建表语句
  static String ddl = '''
create table if not exists $focusTableName
(
    id                INTEGER PRIMARY KEY AUTOINCREMENT, -- 主键
    title             TEXT    NOT NULL,                  -- 标题
    icons             TEXT    NOT NULL,                  -- 图标
    repeat            TEXT    NOT NULL,                  -- 重复
    remind            TEXT    NOT NULL,                  -- 提醒
    type              TEXT,
    targetTime        integer,
    autoRelax         integer,
    shortRelaxTime    integer,
    longRelaxTime     integer,
    longRelaxInterval integer          default 4,
    isDeleted         INTEGER NOT NULL default 0,        -- 是否删除 1: 删除
    gmtDate           TEXT    NOT NULL                   -- 创建日期
);
  ''';

  static String habitClickTable = '''
create table if not exists $habitClickTableName
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,        -- 主键
    habitId  INTEGER,
    value     INTEGER default 0,
    date      TEXT,
    gmtDate   TEXT    NOT NULL            -- 创建日期
);
  ''';

  static String delete = '''
delete from $focusTableName;
 ''';

  static String selectAll = '''
select * from $focusTableName where isDeleted=0
 ''';

  Future<void> createTableAndDefaultValue(Database database) async {
    await database.execute(ddl);
    await database.execute(habitClickTable);
  }

  Future<List<Map<String, Object?>>> query() async {
    return await SqliteProxy.database.rawQuery(selectAll);
  }

  Future<Map<String, Object?>> selectById(String id) async {
    String sql = 'select * from $focusTableName where isDeleted=0 and id= $id';
    List<Map<String, Object?>> list = await SqliteProxy.database.rawQuery(sql);
    if (list.isNotEmpty) {
      return list[0];
    }

    return {};
  }

  Future<void> update(String col, String value, String id) async {
    String sql = 'update $focusTableName set $col=\'$value\' where id=$id';
    await SqliteProxy.database.rawUpdate(sql);
  }

  Future<void> updateById(Map<String, Object?> values, String id) async {
    String sql = '''
    update $focusTableName set title='${values['title']}', 
    icons='${values['icons']}', 
    repeat='${values['repeat']}', 
    target='${values['target']}', 
    remind='${values['remind']}', 
    type='${values['type']}', 
    targetTime='${values['targetTime']}', 
    autoRelax='${values['autoRelax']}', 
    shortRelaxTime='${values['shortRelaxTime']}', 
    longRelaxTime='${values['longRelaxTime']}', 
    longRelaxInterval='${values['longRelaxInterval']}', 
    where id=$id
    ''';

    await SqliteProxy.database.rawUpdate(sql);
  }

  Future<void> insert(Map<String, Object?> values) async {
    await SqliteProxy.database.insert(focusTableName, values);
  }

  Future<void> insertHabitClickAndUpdate(
      double value, String date, String habitId, bool backout) async {
    String sql =
        'select * from $habitClickTableName where habitId=$habitId and date=\'$date\'';

    List<Map<String, Object?>> list = await SqliteProxy.database.rawQuery(sql);
    if (list.isEmpty) {
      await SqliteProxy.database.insert(habitClickTableName, {
        'habitId': habitId,
        'date': date,
        'value': value,
        'gmtDate': DateTime.now().millisecondsSinceEpoch,
      });
    } else {
      Map<String, Object?> mm = list[0];

      double dbValue = double.parse(mm['value'].toString());
      if (backout) {
        value = dbValue - value;

        if (value <= 0) {
          value = 0;
        }
      } else {
        value = value + dbValue;
      }

      String id = mm['id'].toString();
      String sql = 'update $habitClickTableName set value=$value where id=$id';

      print(sql);
      await SqliteProxy.database.rawUpdate(sql);
    }
  }

  Future<Map<String, Object?>> selectClickById(
      String date, String habitId) async {
    String sql =
        'select * from $habitClickTableName where habitId=$habitId and date=\'$date\'';

    List<Map<String, Object?>> list = await SqliteProxy.database.rawQuery(sql);

    if (list.isNotEmpty) {
      return list[0];
    }

    return {};
  }
}
