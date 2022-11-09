import 'package:selfrenew_space/selfrenew_flutter.dart';

class StartDate extends StatefulWidget {
  const StartDate({super.key});

  @override
  State<StatefulWidget> createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  DateTime _selectedDay = DateTime.now();

  static final kToday = DateTime.now();
  final kFirstDay = DateTime(kToday.year, kToday.month - 10, kToday.day);
  final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

  @override
  void initState() {
    super.initState();
    _selectedDay = Provider.of<HabitFormProvider>(context, listen: false)
        .getStartDateTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    HabitFormProvider habitFormProvider = Provider.of(context);
    HabitFormProvider update = Provider.of(context, listen: false);

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
              update.updateStartDateTime(_selectedDay);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: TableCalendar(
          sixWeekMonthsEnforced: false,
          daysOfWeekHeight: 24,
          headerStyle: HeaderStyle(
            headerPadding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
            leftChevronPadding: EdgeInsets.zero,
            rightChevronPadding: EdgeInsets.zero,
            leftChevronMargin: EdgeInsets.zero,
            rightChevronMargin: EdgeInsets.zero,
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(
              Icons.chevron_left,
              size: 28,
              color: Theme.of(context).primaryColor,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              size: 28,
              color: Theme.of(context).primaryColor,
            ),
            titleTextStyle: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .color!
                  .withOpacity(.6),
            ),
            weekendStyle: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .color!
                  .withOpacity(.4),
            ),
          ),
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            defaultTextStyle: TextStyle(
              fontSize: 18.0,
              color: Theme.of(context).textTheme.labelSmall!.color,
            ),
            todayTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            todayDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.5),
              shape: BoxShape.circle,
            ),
            weekendTextStyle: TextStyle(
              fontSize: 18.0,
              color: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .color!
                  .withOpacity(.4),
            ),
            selectedTextStyle: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          currentDay: kToday,
          selectedDayPredicate: (day) {
            return DatetimeUtil.isSameDay(_selectedDay, day);
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: _onDaySelected,
          focusedDay: _selectedDay,
          firstDay: kFirstDay,
          lastDay: kLastDay,
        ),
      ),
    );
  }
}
