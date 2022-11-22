class Notice {
  final String id;
  final String text;

  Notice({
    this.id = '',
    this.text = '',
  });
}

class NoticeSound {
  final String value;
  final String title;
  final String voice;
  late bool selected;

  NoticeSound({
    this.value = '',
    this.title = '',
    this.voice = '',
    this.selected = false,
  });
}
