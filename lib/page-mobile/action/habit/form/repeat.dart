import 'package:selfrenew_space/model/repeat_day.dart';
import 'package:selfrenew_space/page-core/month_view_config.dart';
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

  List<RepeatDay> repeatDays = [];

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      repeatDays.clear();
      setState(() {
        repeatDays.add(RepeatDay(day: '周一', value: '1'));
        repeatDays.add(RepeatDay(day: '周二', value: '2'));
        repeatDays.add(RepeatDay(day: '周三', value: '3'));
        repeatDays.add(RepeatDay(day: '周四', value: '4'));
        repeatDays.add(RepeatDay(day: '周五', value: '5'));
        repeatDays.add(RepeatDay(day: '周六', value: '6'));
        repeatDays.add(RepeatDay(day: '周日', value: '7'));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    HabitFormProvider habitFormProvider = Provider.of(context);

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
                children: List.generate(
                  repeatDays.length,
                  (index) => SimpleTile(
                    onPressed: () {
                      setState(() {
                        repeatDays[index].selected =
                            !repeatDays[index].selected;
                      });
                    },
                    topRadius: index == 0,
                    bottomRadius: index == repeatDays.length - 1,
                    title: repeatDays[index].day,
                    showArrow: false,
                    showDivider: index != repeatDays.length - 1,
                    trailing: ThemeModeCheck(
                      selected: repeatDays[index].selected,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: MonthViewPicker(
                config: MonthViewConfig(
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
