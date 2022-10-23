import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

import 'focus/timer.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: ExtendedNestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              stretch: true,
              backgroundColor: CupertinoColors.systemGroupedBackground,
              border: Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                  width: 0.0, // 0.0 means one physical pixel
                ),
              ),
              largeTitle: Text(
                '概要',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              MobileModule(
                title: '习惯',
                onPressed: () {
                  Routers.go(Routers.habit);
                },
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
                      bottomRadius: true,
                    ),
                  ],
                ),
              ),
              MobileModule(
                title: '专注',
                onPressed: () {
                  Routers.go(Routers.focusHome);
                },
                child: Column(
                  children: [
                    FocusTile(
                      topRadius: true,
                      title: '专注一下',
                      trailing: GestureDetector(
                        onTap: () {
                          SmartDialog.show(builder: (_) {
                            return const FocusTimer();
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.largecircle_fill_circle,
                          size: 28,
                        ),
                      ),
                    ),
                    const FocusTile(
                      title: '读书',
                      trailing: Icon(
                        CupertinoIcons.largecircle_fill_circle,
                        size: 28,
                      ),
                    ),
                    const FocusTile(
                      bottomRadius: true,
                      title: '做题',
                      trailing: Icon(
                        CupertinoIcons.largecircle_fill_circle,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
