import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class TextStyleMode {
  static TextStyle leadingTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: SPHelper.sp(SPHelper.fontSp18),
      fontWeight: FontWeight.normal,
      color: Theme.of(context).primaryColor,
    );
  }

  static TextStyle floatBubbleTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: SPHelper.sp(SPHelper.fontSp16),
      color: Colors.white,
    );
  }
}
