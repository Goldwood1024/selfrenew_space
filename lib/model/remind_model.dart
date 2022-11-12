class RemindModel {
  late List<DateTime> list = [];

  static RemindModel toBean(List<dynamic> data) {
    RemindModel remindModel = RemindModel();

    List<DateTime> list = [];
    for (int a in data) {
      list.add(DateTime.fromMillisecondsSinceEpoch(a));
    }

    remindModel.list = list;
    return remindModel;
  }

  static RemindModel defaultDateTime() {
    RemindModel remindModel = RemindModel();
    remindModel.list.add(DateTime(2000, 01, 02, 09, 00));

    return remindModel;
  }
}
