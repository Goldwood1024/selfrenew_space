class TipChip {
  final String value;
  final String title;
  final String image;
  late String type;

  TipChip({
    required this.value,
    required this.title,
    required this.image,
    this.type = '',
  });
}
