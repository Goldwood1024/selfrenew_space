import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

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
      fontSize: SPHelper.sp(SPHelper.fontSp18),
      color: Colors.white,
    );
  }

  static TextStyle tipTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: SPHelper.sp(SPHelper.fontSp16),
      color: CupertinoColors.systemGrey,
    );
  }
}
