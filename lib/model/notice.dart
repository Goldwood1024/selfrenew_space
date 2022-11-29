class Notice {
  final String id;
  final String text;

  Notice({
    this.id = '',
    this.text = '',
  });
}

class NoticeSound {
  final String id;
  final String title;
  late bool selected;
  bool canSelect;
  final String source;

  NoticeSound({
    required this.id,
    required this.title,
    required this.selected,
    required this.canSelect,
    required this.source,
  });
}
