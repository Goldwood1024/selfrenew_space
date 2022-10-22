import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '行动',
        ),
        actions: const [],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            MobileCard(
              child: Container(
                child: Column(
                  children: const [
                    HabitTile(
                      topRadius: true,
                      title: '冥想',
                      leading: Icon(Icons.access_time_filled),
                      trailing: Icon(
                        Icons.check_circle,
                        size: 28,
                      ),
                    ),
                    HabitTile(
                      title: '刷牙',
                      leading: Icon(Icons.accessible_forward_outlined),
                      trailing: Icon(
                        Icons.radio_button_unchecked_rounded,
                        size: 28,
                      ),
                    ),
                    HabitTile(
                      title: '俯卧歘',
                      leading: Icon(Icons.accessible_forward_outlined),
                      trailing: Icon(
                        Icons.radio_button_unchecked_rounded,
                        size: 28,
                      ),
                    ),
                    HabitTile(
                      title: '喝水',
                      leading: Icon(Icons.hail),
                      bottomRadius: true,
                      trailing: Icon(
                        Icons.radio_button_unchecked_rounded,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MobileCard(
              child: Container(
                child: Column(
                  children: const [
                    FocusTile(
                      title: '专注一下',
                      trailing: Icon(
                        CupertinoIcons.largecircle_fill_circle,
                        size: 28,
                      ),
                    ),
                    FocusTile(
                      title: '读书',
                      trailing: Icon(
                        CupertinoIcons.largecircle_fill_circle,
                        size: 28,
                      ),
                    ),
                    FocusTile(
                      title: '做题',
                      trailing: Icon(
                        CupertinoIcons.largecircle_fill_circle,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
