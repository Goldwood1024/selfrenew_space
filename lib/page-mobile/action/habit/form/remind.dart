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
            // SimpleTile(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       showPicker(
            //         iosStylePicker: true,
            //         context: context,
            //         dialogInsetPadding: const EdgeInsets.symmetric(
            //           horizontal: 14.0,
            //         ),
            //         value: TimeOfDay.now(),
            //         onChange: (_) {},
            //         minuteInterval: MinuteInterval.ONE,
            //         is24HrFormat: true,
            //         okText: '确定',
            //         okStyle: TextStyle(
            //           color: Theme.of(context).primaryColor,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18,
            //         ),
            //         cancelText: '关闭',
            //         cancelStyle: const TextStyle(
            //           color: CupertinoColors.secondaryLabel,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18,
            //         ),
            //         buttonStyle: ButtonStyle(
            //           splashFactory: NoSplash.splashFactory,
            //           overlayColor:
            //               MaterialStateProperty.all(Colors.transparent),
            //         ),
            //         cancelButtonStyle: ButtonStyle(
            //           splashFactory: NoSplash.splashFactory,
            //           overlayColor:
            //               MaterialStateProperty.all(Colors.transparent),
            //         ),
            //         accentColor: Theme.of(context).primaryColor,
            //         onChangeDateTime: (DateTime dateTime) {
            //           debugPrint("[debug datetime]:  $dateTime");
            //         },
            //       ),
            //     );
            //   },
            //   bottomRadius: true,
            //   title: '新增',
            //   leading: Icon(
            //     Icons.add_circle,
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   showArrow: false,
            // ),
            SimpleTileTime(
            )
          ],
        ),
      ),
    );
  }
}
