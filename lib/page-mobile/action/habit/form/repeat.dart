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
  late List<int> weekends = [1, 2, 3, 4, 5, 6, 7];

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

  jump(int index) {
    if (index == tabController.index) {
      return;
    }

    pageController.jumpToPage(index);
  }

  String getDayText(BuildContext context, int weekday) {
    if (1 == weekday) {
      return '周一';
    } else if (2 == weekday) {
      return '周二';
    } else if (3 == weekday) {
      return '周三';
    } else if (4 == weekday) {
      return '周四';
    } else if (5 == weekday) {
      return '周五';
    } else if (6 == weekday) {
      return '周六';
    }

    return '周日';
  }

  @override
  Widget build(BuildContext context) {
    HabitFormProvider habitFormProvider = Provider.of(context);
    HabitFormProvider update = Provider.of(context, listen: false);

    List<int> repeatDays = habitFormProvider.getRepeatDays();

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
              update.updateRepeatType(tabController.index);

              Navigator.pop(context);
            },
          )
        ],
        bottom: CustomSegmentBottom(
          initialValue: 0,
          height: 48,
          onValueChanged: (int value) {
            pageController.jumpToPage(value);
          },
          children: const {
            0: Text(
              '每日',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            1: Text(
              '每月',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          },
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePadding,
        child: PageView(
          controller: pageController,
          children: [
            Column(
              children: List.generate(
                weekends.length,
                (index) => SimpleTile(
                  onPressed: () {
                    update.updateRepeatDay(index + 1);
                  },
                  topRadius: index == 0,
                  bottomRadius: index == weekends.length - 1,
                  title: getDayText(context, weekends[index]),
                  showArrow: false,
                  showDivider: index != weekends.length - 1,
                  trailing: ThemeModeCheck(
                    selected: repeatDays.contains(weekends[index]),
                  ),
                ),
              ),
            ),
            MonthViewPicker(
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
              selectedDates: habitFormProvider.getSelectedDates(),
              onChanged: (DateTime value) {
                setState(() {
                  update.updateSelectedDates(value);
                });
              },
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
