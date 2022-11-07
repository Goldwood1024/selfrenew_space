import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
            SimpleTile(
              topRadius: true,
              title: '完成提示音',
              trailing: Text(
                '滴答',
                style: TextStyleMode.trailingTextStyle(context),
              ),
            ),
            SimpleTile(
              title: '休息提示音',
              trailing: Text(
                '风琴',
                style: TextStyleMode.trailingTextStyle(context),
              ),
            ),
            SimpleTile(
              bottomRadius: true,
              title: '震动反馈',
              showArrow: false,
              trailing: CommonSwitch(
                func: (bool) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
