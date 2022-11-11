import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/page-core/tile/simple_tile_time.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class Remind extends StatefulWidget {
  const Remind({super.key});

  @override
  State<StatefulWidget> createState() => _RemindState();
}

class _RemindState extends State<Remind> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HabitFormProvider update = Provider.of(context, listen: false);
    HabitFormProvider habitFormProvider = Provider.of(context);
    List<DateTime> list = habitFormProvider.getRemindDates();

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
            // SPHelper.getDefaultHeightBox(),
            // SimpleTile(
            //   topRadius: true,
            //   bottomRadius: true,
            //   title: '提醒',
            //   showArrow: false,
            //   trailing: CommonSwitch(
            //     value: true,
            //     func: (_) {},
            //   ),
            // ),
            SPHelper.getDefaultHeightBox(),
            Column(
              children: List.generate(
                list.length,
                (index) => SimpleTileTime(
                  showDivider: true,
                  showBtn: true,
                  topRadius: index == 0,
                  dateTime: list[index],
                  onValueChanged: (_) {
                    update.removeAddRemindDate(list[index], _);
                  },
                  onRemoved: (_) {
                    update.removeRemindDate(_);
                  },
                ),
              ),
            ),
            SimpleTileTime(
              onValueChanged: (_) {
                update.updateRemindDates(_);
              },
              dateTime: DateTime.now(),
              topRadius: list.isEmpty,
              showBtn: false,
              bottomRadius: true,
            )
          ],
        ),
      ),
    );
  }
}
