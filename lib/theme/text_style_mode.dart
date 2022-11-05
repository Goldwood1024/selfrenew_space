import 'package:calendar_date_picker2/calendar_date_picker2.dart';
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

  static TextStyle trailingTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: SPHelper.sp(
        SPHelper.fontSp17,
      ),
      color: Theme.of(context).textTheme.labelSmall!.color?.withOpacity(0.5),
    );
  }

  static CalendarDatePicker2Config config(BuildContext context) {
    return CalendarDatePicker2Config(
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      dayTextStyle: TextStyle(
        fontSize: 18,
        color: Theme.of(context).textTheme.labelSmall!.color,
      ),
      todayTextStyle: TextStyle(
        fontSize: 18,
        color: Theme.of(context).primaryColor,
      ),
      selectedDayTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      selectedDayHighlightColor: Theme.of(context).primaryColor,
      controlsHeight: 56,
      calendarType: CalendarDatePicker2Type.single,
    );
  }
}
