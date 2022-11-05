import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

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
          config: TextStyleMode.config(context),
          initialValue: [],
        ),
      ),
    );
  }
}
