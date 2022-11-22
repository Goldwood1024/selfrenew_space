import 'package:selfrenew_space/page-core/month_view_config.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusRepeat extends StatefulWidget {
  const FocusRepeat({super.key});

  @override
  State<StatefulWidget> createState() => _FocusRepeatState();
}

class _FocusRepeatState extends State<FocusRepeat> with TickerProviderStateMixin {
  late List<DateTime> selectedDates;
  late List<int> weekends = [1, 2, 3, 4, 5, 6, 7];
  late List<int> repeatDays = [];
  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    selectedDates = [];
    repeatDays = [];
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
    FocusFormProvider focusFormProvider = Provider.of(context);
    FocusFormProvider update = Provider.of(context, listen: false);
    if (focusFormProvider.getRepeatType() == 0) {
      repeatDays = focusFormProvider.getRepeatDays();
    } else {
      selectedDates = focusFormProvider.getSelectedDates();
    }

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
              if (focusFormProvider.getRepeatType() == 0) {
                update.updateRepeatDay(repeatDays);
              } else {
                update.updateSelectedDates(selectedDates);
              }

              Navigator.pop(context);
            },
          )
        ],
        bottom: CustomSegmentBottom(
          initialValue: focusFormProvider.getRepeatType(),
          height: 48,
          onValueChanged: (int value) {
            setState(() {
              _currentIndex = value;
              update.updateRepeatType(_currentIndex);
            });
          },
          children: {
            0: Text(
              '每日',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
            ),
            1: Text(
              '每月',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
            ),
          },
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePadding,
        child: LazyLoadIndexedStack(
          index: focusFormProvider.getRepeatType(),
          children: [
            Column(
              children: List.generate(
                weekends.length,
                (index) => SimpleTile(
                  onPressed: () {
                    int value = index + 1;
                    setState(() {
                      if (repeatDays.contains(value)) {
                        repeatDays.removeWhere((element) => element == value);
                      } else {
                        repeatDays.add(value);
                      }
                    });
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
              selectedDates: selectedDates,
              onChanged: (DateTime value) {
                setState(() {
                  if (selectedDates.contains(value)) {
                    selectedDates.removeWhere((element) => value == element);
                  } else {
                    selectedDates.add(value);
                  }
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
