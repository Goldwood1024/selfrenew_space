import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusRepository {
  static String focusTableName = 'focus';
  static String focusClickTableName = 'focus_click';

  /// 建表语句
  static String focus = '''
create table if not exists $focusTableName
(
    id                INTEGER PRIMARY KEY AUTOINCREMENT, -- 主键
    title             TEXT    NOT NULL,                  -- 标题
    icons             TEXT    NOT NULL,                  -- 图标
    repeat            TEXT    NOT NULL,                  -- 重复
    remind            TEXT    NOT NULL,                  -- 提醒
    type              TEXT,
    targetTime        integer,
    autoRelax         integer default 0, -- 0:否
    skipRelax         integer default 0,
    shortRelaxTime    integer,
    longRelaxTime     integer,
    longRelaxInterval integer          default 4,
    isDeleted         INTEGER NOT NULL default 0,        -- 是否删除 1: 删除
    gmtDate           TEXT    NOT NULL                   -- 创建日期
);
  ''';

  static String focusClickTable = '''
create table if not exists $focusClickTableName
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,        -- 主键
    focusId   INTEGER,
    count     INTEGER default 1,
    time      INTEGER default 0,
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
    await database.execute(focus);
    await database.execute(focusClickTable);
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
    remind='${values['remind']}', 
    targetTime='${values['targetTime']}', 
    autoRelax='${values['autoRelax']}', 
    skipRelax='${values['skipRelax']}', 
    shortRelaxTime='${values['shortRelaxTime']}', 
    longRelaxTime='${values['longRelaxTime']}', 
    longRelaxInterval='${values['longRelaxInterval']}'
    where id=$id
    ''';

    await SqliteProxy.database.rawUpdate(sql);
  }

  Future<void> insert(Map<String, Object?> values) async {
    await SqliteProxy.database.insert(focusTableName, values);
  }

  Future<void> insertFocusClick(
    int count,
    int time,
    String date,
    String focusId,
  ) async {
    await SqliteProxy.database.insert(focusClickTableName, {
      'focusId': focusId,
      'date': date,
      'count': count,
      'time': time,
      'gmtDate': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<int> selectClickById(String date, String focusId) async {
    String sql =
        'select * from $focusClickTableName where focusId=$focusId and date=\'$date\'';

    List<Map<String, Object?>> list = await SqliteProxy.database.rawQuery(sql);

    if (list.isNotEmpty) {
      return list.length;
    }

    return 0;
  }
}
