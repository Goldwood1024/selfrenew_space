import 'dart:math' as math;

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/rendering.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class MonthViewPicker extends StatefulWidget {
  const MonthViewPicker({
    required this.config,
    required this.displayedMonth,
    required this.selectedDates,
    required this.onChanged,
    this.selectableDayPredicate,
    Key? key,
  }) : super(key: key);

  final CalendarDatePicker2Config config;
  final List<DateTime> selectedDates;
  final ValueChanged<DateTime> onChanged;
  final DateTime displayedMonth;
  final SelectableDayPredicate? selectableDayPredicate;

  @override
  MonthViewPickerState createState() => MonthViewPickerState();
}

class MonthViewPickerState extends State<MonthViewPicker> {
  late List<FocusNode> _dayFocusNodes;

  @override
  void initState() {
    super.initState();

    final int daysInMonth = DateUtils.getDaysInMonth(
        widget.displayedMonth.year, widget.displayedMonth.month);
    _dayFocusNodes = List<FocusNode>.generate(
      daysInMonth,
      (int index) =>
          FocusNode(skipTraversal: true, debugLabel: 'Day ${index + 1}'),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final DateTime? focusedDate = _FocusedDate.of(context);
    if (focusedDate != null &&
        DateUtils.isSameMonth(widget.displayedMonth, focusedDate)) {
      _dayFocusNodes[focusedDate.day - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    for (final FocusNode node in _dayFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle dayStyle = textTheme.bodySmall!;
    final Color enabledDayColor = colorScheme.onSurface.withOpacity(0.87);
    const Color selectedDayColor = Colors.white;

    final int year = widget.displayedMonth.year;
    final int month = widget.displayedMonth.month;

    final int daysInMonth = DateUtils.getDaysInMonth(year, month);
    final int dayOffset = DateUtils.firstDayOffset(year, month, localizations);

    final List<Widget> dayItems = [];
    int day = -dayOffset;
    while (day < daysInMonth) {
      day++;
      if (day >= 1) {
        final DateTime dayToBuild = DateTime(year, month, day);
        final bool isSelectedDay = widget.selectedDates.any(
          (d) => DateUtils.isSameDay(d, dayToBuild),
        );

        final bool isToday = DateUtils.isSameDay(
          widget.config.currentDate,
          dayToBuild,
        );

        BoxDecoration? decoration;
        Color dayColor = enabledDayColor;
        if (isSelectedDay) {
          dayColor = selectedDayColor;
          decoration = BoxDecoration(
            borderRadius: widget.config.dayBorderRadius,
            color: widget.config.selectedDayHighlightColor ?? Colors.grey,
            shape: widget.config.dayBorderRadius != null
                ? BoxShape.rectangle
                : BoxShape.circle,
          );
        }

        var customDayTextStyle = widget.config.dayTextStyle;

        if (isSelectedDay) {
          customDayTextStyle = widget.config.selectedDayTextStyle;
        }

        Widget dayWidget = Row(
          children: [
            const Spacer(),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: decoration,
                child: Center(
                  child: Text(
                    localizations.formatDecimal(day),
                    style:
                        customDayTextStyle ?? dayStyle.apply(color: dayColor),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        );

        dayWidget = Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: dayWidget,
        );

        dayWidget = InkResponse(
          focusNode: _dayFocusNodes[day - 1],
          onTap: () => widget.onChanged(dayToBuild),
          splashColor: Colors.transparent,
          child: Semantics(
            selected: isSelectedDay,
            excludeSemantics: true,
            child: dayWidget,
          ),
        );

        dayItems.add(dayWidget);
      }
    }

    return Padding(
      padding: EdgeInsets.zero,
      child: GridView.custom(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const _DayPickerGridDelegate(),
        childrenDelegate: SliverChildListDelegate(
          dayItems,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class _DayPickerGridDelegate extends SliverGridDelegate {
  const _DayPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;
    final double tileWidth = constraints.crossAxisExtent / columnCount;
    final double tileHeight = math.min(
      45,
      constraints.viewportMainAxisExtent / (2 + 1),
    );
    return SliverGridRegularTileLayout(
      childCrossAxisExtent: tileWidth,
      childMainAxisExtent: tileHeight,
      crossAxisCount: columnCount,
      crossAxisStride: tileWidth,
      mainAxisStride: tileHeight,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_DayPickerGridDelegate oldDelegate) => false;
}

class _FocusedDate extends InheritedWidget {
  const _FocusedDate({
    Key? key,
    required Widget child,
    this.date,
  }) : super(key: key, child: child);

  final DateTime? date;

  @override
  bool updateShouldNotify(_FocusedDate oldWidget) {
    return !DateUtils.isSameDay(date, oldWidget.date);
  }

  static DateTime? of(BuildContext context) {
    final _FocusedDate? focusedDate =
        context.dependOnInheritedWidgetOfExactType<_FocusedDate>();
    return focusedDate?.date;
  }
}
