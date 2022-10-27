import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  late ScrollController _nestedScrollController;
  late bool showWeek;

  @override
  void initState() {
    super.initState();

    _nestedScrollController = ScrollController();

    // 显示星期
    showWeek = false;
    _nestedScrollController.addListener(() {
      if (!showWeek && _nestedScrollController.offset > SPHelper.gapDp42) {
        setState(() {
          showWeek = true;
        });
      }

      if (_nestedScrollController.offset <= SPHelper.gapDp42) {
        setState(() {
          showWeek = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _nestedScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: ExtendedNestedScrollView(
        controller: _nestedScrollController,
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
              leading: showWeek
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(
                        SPHelper.width(SPHelper.gapDp18),
                        SPHelper.width(SPHelper.gapDp12),
                        0,
                        0,
                      ),
                      child: Text(
                        DatetimeUtil.weekday(context),
                        style: TextStyle(
                          fontSize: SPHelper.sp(SPHelper.fontSp18),
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : Container(),
              largeTitle: const Text(
                '概要',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: ActionIconBtn(
                icon: const Icon(
                  Icons.more_horiz_sharp,
                ),
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const MobileActionBottom(),
                  );
                },
              ),
            )
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
                        value: 2,
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
                        max: 10,
                        value: 22,
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
                      bottomRadius: true,
                      title: '专注一下',
                      leading: Container(
                        child: SvgPicture.asset(
                          'assets/icons/浴盆.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          SmartDialog.show(builder: (_) {
                            return const FocusTimer();
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            SmartDialog.show(
                              alignment: Alignment.bottomCenter,
                              keepSingle: true,
                              useAnimation: true,
                              builder: (_) {
                                return const FocusTimer();
                              },
                            );
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Icon(
                            CupertinoIcons.play_circle_fill,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
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
