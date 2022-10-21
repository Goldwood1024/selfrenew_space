import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class AppBarText extends StatelessWidget {
  final String title;

  const AppBarText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: SPHelper.fontSp20,
        color: Theme.of(context).textTheme.displayLarge?.color,
      ),
    );
  }
}
