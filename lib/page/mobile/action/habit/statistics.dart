import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/action/focus/focus_form_card.dart';

import 'statistic_crad.dart';

class HabitStatistics extends StatefulWidget {
  const HabitStatistics({super.key});

  @override
  State<StatefulWidget> createState() => _HabitStatistics();
}

class _HabitStatistics extends State<HabitStatistics> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  late bool selected;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    selected = false;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  List _eventLoader(DateTime day) {
    return ['', ''];
  }

  static const dataList = [
    _BarData(Color(0xFFecb206), 4),
    _BarData(Color(0xFFa8bd1a), 3),
    _BarData(Color(0xFF17987b), 5),
    _BarData(Color(0xFF17987b), 5),
    _BarData(Color(0xFFb87d46), 2),
    _BarData(Color(0xFFb87d46), 2),
    _BarData(Color(0xFF295ab5), 2),
    _BarData(Color(0xFF295ab5), 1),
    _BarData(Color(0xFFea0107), 3),
    _BarData(Color(0xFFea0107), 2),
    _BarData(Color(0xFFea0107), 3),
    _BarData(Color(0xFFea0107), 2),
    _BarData(Color(0xFFea0107), 5),
    _BarData(Color(0xFFea0107), 3),
    _BarData(Color(0xFFea0107), 2),
    _BarData(Color(0xFFea0107), 1),
    _BarData(Color(0xFFea0107), 1),
    _BarData(Color(0xFFea0107), 2),
    _BarData(Color(0xFFea0107), 1),
    _BarData(Color(0xFFea0107), 5),
    _BarData(Color(0xFFea0107), 1),
    _BarData(Color(0xFFea0107), 4),
    _BarData(Color(0xFFea0107), 1),
    _BarData(Color(0xFFea0107), 2),
    _BarData(Color(0xFFea0107), 1),
    _BarData(Color(0xFFea0107), 0),
  ];

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 4,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: SPHelper.appBarHeight(),
          leading: BackBtn(
            title: '习惯',
            onPressed: () {
              Routers.pop();
            },
          ),
          leadingWidth: 80,
          title: Text(
            '喝水',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: SPHelper.appBarFontSize,
              color: Theme.of(context).textTheme.displayLarge?.color,
            ),
          ),
          actions: [],
        ),
        body: Padding(
          padding: SPHelper.pagePadding,
          child: ListView(
            children: [
              FocusFormCard(
                title: '健身',
                fontWeight: FontWeight.w500,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const StatisticCard(
                            icon: Icons.timelapse_rounded,
                            iconColor: Color(0xFF17987b),
                            title: '10000',
                            description: '专注总时长(分钟)',
                          ),
                          SPHelper.getWidthBox(
                              SPHelper.pageHorizontalPadding()),
                          const StatisticCard(
                            icon: Icons.bubble_chart,
                            iconColor: Color(0xFFea0107),
                            title: '300',
                            description: '今日专注(分钟)',
                          ),
                        ],
                      ),
                      SPHelper.getHeightBox(SPHelper.pageHorizontalPadding()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const StatisticCard(
                            icon: Icons.restart_alt,
                            iconColor: Colors.blueAccent,
                            title: '2000',
                            description: '完成番茄',
                          ),
                          SPHelper.getWidthBox(
                              SPHelper.pageHorizontalPadding()),
                          const StatisticCard(
                            icon: Icons.local_fire_department_sharp,
                            iconColor: Color(0xFFb87d46),
                            title: '2020.10.01',
                            description: '首次专注日期',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TableCalendar(
                  eventLoader: _eventLoader,
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
                  headerStyle: const HeaderStyle(
                    formatButtonPadding: EdgeInsets.zero,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    formatButtonVisible: false,
                    formatButtonTextStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                    formatButtonDecoration: BoxDecoration(),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      size: SPHelper.btnSettingIconSize,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      size: SPHelper.btnSettingIconSize,
                    ),
                    leftChevronPadding: EdgeInsets.all(8.0),
                    rightChevronPadding: EdgeInsets.all(8.0),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey2,
                    ),
                    weekendStyle: TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey2,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    markerDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    markersMaxCount: 1,
                    markerSizeScale: 0.12,
                    markersAnchor: 2,
                    canMarkersOverflow: true,
                    outsideDaysVisible: false,
                    todayDecoration: const BoxDecoration(
                      color: CupertinoColors.white,
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
                    defaultTextStyle: const TextStyle(
                      fontSize: SPHelper.calendarFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                    weekendTextStyle: const TextStyle(
                      fontSize: SPHelper.calendarFontSize,
                      fontWeight: FontWeight.w600,
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
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  holidayPredicate: (day) {
                    return false;
                  },
                  calendarFormat: _calendarFormat,
                  rowHeight: 48,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: List.generate(
                    10,
                    (index) => Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '2020.09.01',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                                child: Icon(Icons.smoke_free_outlined),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: ReadMoreText(
                              '发发发发发奋斗奋斗发的房价低分局哦i阿手打激发i久啊手发的范德萨范德萨发发的范德萨范德萨发发的范德萨范德萨发打发的范德萨范德萨发丰富的辅导费发的发的发生丰富的辅导费发的发的发生',
                              trimLines: 3,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '更多',
                              trimExpandedText: '更少',
                              moreStyle: TextStyle(
                                fontSize: 14,
                              ),
                              lessStyle: TextStyle(
                                fontSize: 14,
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  final Color color;
  final bool isSelected;

  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>;
  }
}

class _BarData {
  final Color color;
  final double value;

  const _BarData(this.color, this.value);
}
