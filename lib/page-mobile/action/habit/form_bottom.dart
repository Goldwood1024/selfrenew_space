import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class Repeat extends StatefulWidget {
  const Repeat({super.key});

  @override
  State<StatefulWidget> createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> with TickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController = PageController();
  late List<DateTime> selectedDates;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
    );

    tabController.addListener(() {
      pageController.jumpToPage(tabController.index);
    });

    selectedDates = [];
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
      body: Padding(
        padding: SPHelper.pagePadding,
        child: PageView(
          controller: pageController,
          children: [
            Container(
              child: Column(
                children: const [
                  SimpleTile(
                    topRadius: true,
                    title: '周一',
                  ),
                  SimpleTile(
                    title: '周二',
                  ),
                  SimpleTile(
                    title: '周三',
                  ),
                  SimpleTile(
                    title: '周四',
                  ),
                  SimpleTile(
                    title: '周五',
                  ),
                  SimpleTile(
                    title: '周六',
                  ),
                  SimpleTile(
                    title: '周日',
                    bottomRadius: true,
                  ),
                ],
              ),
            ),
            Container(
              child: MonthViewPicker(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.multi,
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
                ),
                displayedMonth: DateTime(202301),
                selectedDates: selectedDates,
                onChanged: (DateTime value) {
                  setState(() {
                    selectedDates.add(value);
                  });
                },
              ),
            ),
            Container(),
          ],
        ),
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
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            SimpleTile(
              topRadius: true,
              bottomRadius: true,
              title: '提醒',
              showArrow: false,
              trailing: CommonSwitch(
                value: true,
                func: (_) {},
              ),
            ),
            SPHelper.getDefaultHeightBox(),
            Container(
              child: Column(
                children: List.generate(
                  3,
                  (index) => SimpleTile(
                    showDivider: true,
                    leading: const Icon(Icons.timer_sharp),
                    topRadius: index == 0,
                    title: '09:20',
                    showArrow: false,
                    trailing: GestureDetector(
                      child: const Icon(
                        Icons.clear,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SimpleTile(
              onPressed: () {
                Navigator.of(context).push(
                  showPicker(
                    iosStylePicker: true,
                    context: context,
                    dialogInsetPadding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                    ),
                    value: TimeOfDay.now(),
                    onChange: (_) {},
                    minuteInterval: MinuteInterval.ONE,
                    is24HrFormat: true,
                    okText: '确定',
                    okStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    cancelText: '关闭',
                    cancelStyle: const TextStyle(
                      color: CupertinoColors.secondaryLabel,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    buttonStyle: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    cancelButtonStyle: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    accentColor: Theme.of(context).primaryColor,
                    onChangeDateTime: (DateTime dateTime) {
                      debugPrint("[debug datetime]:  $dateTime");
                    },
                  ),
                );
              },
              bottomRadius: true,
              title: '新增',
              leading: Icon(
                Icons.add_circle,
                color: Theme.of(context).primaryColor,
              ),
              showArrow: false,
            ),
          ],
        ),
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
  @override
  void initState() {
    super.initState();
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
        child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
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
          ),
          initialValue: const [],
        ),
      ),
    );
  }
}
