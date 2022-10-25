import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/core/sleek_counter.dart';

import 'focus/timer.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  double i = 0;

  @override
  void initState() {
    super.initState();
    i = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CupertinoSliverNavigationBar(
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 0, 0),
                child: Text(
                  '星期五',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
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
                      title: '冥想22333',
                      leading: SvgPicture.asset(
                        'assets/icons/浴盆.svg',
                        width: 24,
                        height: 24,
                      ),
                      trailing: const SleekCounter(
                        min: 0,
                        max: 10,
                        value: 1,
                        fail: false,
                      ),
                    ),
                    HabitTile(
                      bottomRadius: true,
                      title: '喝一杯水',
                      leading: SvgPicture.asset(
                        'assets/icons/浴盆.svg',
                        width: 24,
                        height: 24,
                      ),
                      trailing: const SleekCounter(
                        min: 0,
                        max: 2,
                        value: 10,
                        fail: false,
                      ),
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
                      leading: Container(
                        child: SvgPicture.asset(
                          'assets/icons/浴盆.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
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
