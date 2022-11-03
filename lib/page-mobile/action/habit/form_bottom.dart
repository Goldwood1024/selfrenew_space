import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class Repeat extends StatefulWidget {
  const Repeat({super.key});

  @override
  State<StatefulWidget> createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '重复',
        ),
        actions: [
          ActionBtn(
            title: '确定',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        bottom: TabBar(
          controller: tabController,
          labelColor: Theme.of(context).textTheme.labelSmall!.color,
          physics: const NeverScrollableScrollPhysics(),
          splashFactory: NoSplash.splashFactory,
          labelPadding: EdgeInsets.fromLTRB(
            0,
            0,
            0,
            SPHelper.width(SPHelper.gapDp10),
          ),
          labelStyle: TextStyle(
            fontSize: SPHelper.sp(SPHelper.fontSp16),
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: SPHelper.sp(SPHelper.fontSp16),
            fontWeight: FontWeight.w500,
          ),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorPadding: EdgeInsets.fromLTRB(
            SPHelper.width(SPHelper.gapDp24),
            0,
            SPHelper.width(SPHelper.gapDp24),
            0,
          ),
          tabs: [
            ExtendedTab(
              size: SPHelper.width(100),
              text: '每日',
              scrollDirection: Axis.vertical,
            ),
            ExtendedTab(
              size: SPHelper.width(100),
              text: '每月',
              scrollDirection: Axis.vertical,
            ),
            ExtendedTab(
              size: SPHelper.width(100),
              text: '间隔',
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}

class Target extends StatefulWidget {
  const Target({super.key});

  @override
  State<StatefulWidget> createState() => _TargetState();
}

class _TargetState extends State<Target> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '目标',
        ),
        actions: [
          ActionBtn(
            title: '确定',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class Remind extends StatefulWidget {
  const Remind({super.key});

  @override
  State<StatefulWidget> createState() => _RemindState();
}

class _RemindState extends State<Remind> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '提醒',
        ),
        actions: [
          ActionBtn(
            title: '确定',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class StartDate extends StatefulWidget {
  const StartDate({super.key});

  @override
  State<StatefulWidget> createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  void initState() {
    super.initState();

    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '开始日期',
        ),
        actions: [
          ActionBtn(
            title: '确定',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: TableCalendar(
          availableGestures: AvailableGestures.horizontalSwipe,
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) => DatetimeUtil.isSameDay(
            _selectedDay,
            day,
          ),
          focusedDay: _focusedDay,
          firstDay: DateTime(2020, 01, 01),
          lastDay: DateTime(2033, 12, 31),
          locale: 'zh_CN',
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.labelSmall!.color,
            ),
            formatButtonVisible: false,
            leftChevronIcon: Icon(
              Icons.chevron_left,
              size: SPHelper.btnSettingIconSize,
              color: Theme.of(context).primaryColor,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              size: SPHelper.btnSettingIconSize,
              color: Theme.of(context).primaryColor,
            ),
            leftChevronPadding: EdgeInsets.zero,
            rightChevronPadding: EdgeInsets.zero,
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemGrey2,
            ),
            weekendStyle: TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemGrey2,
            ),
          ),
          calendarStyle: CalendarStyle(
            markerDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            todayTextStyle: TextStyle(
              fontSize: SPHelper.calendarFontSize,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
            defaultTextStyle: TextStyle(
              fontSize: SPHelper.calendarFontSize,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.labelSmall!.color,
            ),
            weekendTextStyle: TextStyle(
              fontSize: SPHelper.calendarFontSize,
              fontWeight: FontWeight.w600,
              color: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .color!
                  .withOpacity(0.2),
            ),
            outsideTextStyle: const TextStyle(
              color: CupertinoColors.systemGrey3,
              fontSize: SPHelper.calendarFontSize,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: const TextStyle(
              fontSize: SPHelper.calendarFontSize,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.white,
            ),
            weekNumberTextStyle: const TextStyle(
              fontSize: 12,
              color: CupertinoColors.systemGrey3,
            ),
          ),
          holidayPredicate: (day) {
            return false;
          },
          calendarFormat: CalendarFormat.month,
          rowHeight: 56,
        ),
      ),
    );
  }
}
