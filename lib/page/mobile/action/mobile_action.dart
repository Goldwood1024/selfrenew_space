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
            CupertinoSliverNavigationBar(
              stretch: true,
              backgroundColor: CupertinoColors.systemGroupedBackground,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                  width: 0.0, // 0.0 means one physical pixel
                ),
              ),
              leading: const Padding(
                padding: EdgeInsets.fromLTRB(2, 10, 0, 0),
                child: Text(
                  '周五',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              largeTitle: const Text(
                '概要',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
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
                title: '日常习惯',
                onPressed: () {
                  Routers.go(Routers.habit);
                },
                child: Column(
                  children: [
                    HabitTile(
                      topRadius: true,
                      bottomRadius: true,
                      title: '冥想',
                      leading: Container(
                        child: SvgPicture.asset(
                          'assets/icons/浴盆.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      trailing: Icon(
                        Icons.check_circle,
                        size: 28,
                      ),
                    ),
                    // HabitTile(
                    //   title: '刷牙',
                    //   leading: Icon(Icons.accessible_forward_outlined),
                    //   trailing: Icon(
                    //     Icons.radio_button_unchecked_rounded,
                    //     size: 28,
                    //   ),
                    // ),
                    // HabitTile(
                    //   title: '俯卧歘',
                    //   leading: Icon(Icons.accessible_forward_outlined),
                    //   trailing: Icon(
                    //     Icons.radio_button_unchecked_rounded,
                    //     size: 28,
                    //   ),
                    //   bottomRadius: true,
                    // ),
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
