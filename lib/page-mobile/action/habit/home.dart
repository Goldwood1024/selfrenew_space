import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class HabitHome extends StatefulWidget {
  const HabitHome({super.key});

  @override
  State<StatefulWidget> createState() => _HabitHomeState();
}

class _HabitHomeState extends State<HabitHome> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late int _tabIndex;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.easeInOut,
        parent: _animationController,
      ),
    );

    _tabIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      color: Colors.transparent,
      backdropEnabled: true,
      backdropColor: Colors.black12,
      maxHeight: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top,
      panelBuilder: () {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            width: double.infinity,
            child: MediaQuery.removePadding(
              context: context,
              child: Scaffold(
                body: LazyLoadIndexedStack(
                  index: _tabIndex,
                  children: const [
                    Completed(),
                    Abandon(),
                  ],
                ),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: SPHelper.height(32),
                  bottom: CustomSegmentBottom(
                    initialValue: 0,
                    onValueChanged: (int value) {
                      setState(() {
                        _tabIndex = value;
                      });
                    },
                    children: const {
                      0: Text(
                        '已完成',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      1: Text(
                        '已放弃',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
      boxShadow: const <BoxShadow>[
        BoxShadow(
          blurRadius: 12.0,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        )
      ],
      disableDraggableOnScrolling: true,
      onPanelSlide: (_) {
        if (_ > 0) {
          setState(() {
            _animationController.reverse();
          });
        }
      },
      onPanelClosed: () {},
      onPanelOpened: () {},
      header: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ForceDraggableWidget(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ScaffoldGradientBackground(
        appBar: AppBar(
          toolbarHeight: SPHelper.topBarHeight,
          title: const AppBarText(
            title: '习惯',
          ),
          leadingWidth: SPHelper.leadingWidth,
          leading: BackBtn(
            title: '计划',
            onPressed: () {
              Routers.go(Routers.mobileHome);
            },
          ),
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: SPHelper.pagePaddingHorizontal,
              child: ListView(
                children: [
                  SPHelper.getDefaultHeightBox(),
                  const Underway(),
                ],
              ),
            ),
            Padding(
              padding: SPHelper.pagePaddingHorizontal,
              child: Align(
                child: FloatingActionBubble(
                  items: [
                    Bubble(
                      title: "创建好习惯",
                      iconColor: Colors.white,
                      bubbleColor: Theme.of(context).primaryColor,
                      icon: CupertinoIcons.loop,
                      titleStyle: TextStyleMode.floatBubbleTextStyle(context),
                      onPress: () {
                        _animationController.reverse();
                        Routers.pushParams(Routers.habitSelect, {
                          "good": '1',
                        });
                      },
                    ),
                    Bubble(
                      title: "消灭坏习惯",
                      iconColor: Colors.white,
                      bubbleColor: Theme.of(context).primaryColor,
                      icon: CupertinoIcons.nosign,
                      titleStyle: TextStyleMode.floatBubbleTextStyle(context),
                      onPress: () {
                        _animationController.reverse();
                        Routers.pushParams(Routers.habitSelect, {
                          "good": '0',
                        });
                      },
                    ),
                  ],
                  onPress: () {
                    _animationController.isCompleted
                        ? _animationController.reverse()
                        : _animationController.forward();
                  },
                  iconColor: Colors.white,
                  iconData: Icons.add,
                  backGroundColor: Theme.of(context).primaryColor,
                  animation: _animation,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Underway extends StatefulWidget {
  const Underway({super.key});

  @override
  State<StatefulWidget> createState() => _UnderwayState();
}

class _UnderwayState extends State<Underway> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // 加载数据
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HabitProvider>(context, listen: false).reloadHabitUnderway();
    });
  }

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of(context);

    final List<HabitUnderway> list = habitProvider.getHabitUnderway();
    return habitProvider.hasUnderway()
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              HabitUnderway data = list[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    0, SPHelper.height(SPHelper.gapDp8), 0, 0),
                child: HabitHomeTile(
                  key: LabeledGlobalKey(data.id),
                  title: data.title,
                  id: data.id,
                  subTitle: Column(
                    children: [
                      SPHelper.getHeightBox(SPHelper.gapDp4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.timer,
                            size: SPHelper.sp(SPHelper.fontSp18),
                            color: CupertinoColors.systemGrey2,
                          ),
                          SPHelper.getWidthBox(SPHelper.gapDp8),
                          Text(
                            data.repeat,
                            style: TextStyle(
                              color: CupertinoColors.systemGrey2,
                              fontSize: SPHelper.sp(SPHelper.fontSp15),
                            ),
                          ),
                        ],
                      ),
                      SPHelper.getHeightBox(SPHelper.gapDp4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.app_badge,
                            size: SPHelper.sp(SPHelper.fontSp18),
                            color: CupertinoColors.systemGrey2,
                          ),
                          Row(
                            children: List.generate(
                              data.notices.length,
                              (index) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                    SPHelper.width(SPHelper.gapDp8), 0, 0, 0),
                                child: Text(
                                  data.notices[index].text,
                                  style: TextStyle(
                                    color: CupertinoColors.systemGrey2,
                                    fontSize: SPHelper.sp(SPHelper.fontSp15),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  topRadius: true,
                  bottomRadius: true,
                  leading: SvgLoader(
                    path: data.icons.icon,
                    size: SPHelper.sp(SPHelper.gapDp28),
                  ),
                  trailing: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      data.sleeks.length,
                      (idx) => SleekCounter(
                        min: data.sleeks[idx].min,
                        max: data.sleeks[idx].max,
                        value: data.sleeks[idx].value,
                        fail: data.sleeks[idx].fail,
                        day: data.sleeks[idx].dateTime.day,
                        sm: true,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : const ImageDefaultEmpty(
            title: '还没有习惯，快添加习惯吧',
            imagePath: 'assets/icons/habit.svg',
          );
  }
}

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<StatefulWidget> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> with TickerProviderStateMixin {
  late bool expand;

  @override
  void initState() {
    super.initState();
    expand = true;
  }

  @override
  void dispose() {
    expand = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: expand ? 20 : 0,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: HabitHomeTile(
                    title: '八段锦八段锦',
                    subTitle: Column(
                      children: [
                        SPHelper.getHeightBox(SPHelper.gapDp4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.timer,
                              size: SPHelper.sp(SPHelper.fontSp18),
                              color: CupertinoColors.systemGrey2,
                            ),
                            SPHelper.getWidthBox(SPHelper.gapDp8),
                            Text(
                              '每天',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey2,
                                fontSize: SPHelper.sp(SPHelper.fontSp15),
                              ),
                            ),
                          ],
                        ),
                        SPHelper.getHeightBox(SPHelper.gapDp4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.app_badge,
                              size: SPHelper.sp(SPHelper.fontSp18),
                              color: CupertinoColors.systemGrey2,
                            ),
                            SPHelper.getWidthBox(SPHelper.gapDp8),
                            Text(
                              '08:00',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey2,
                                fontSize: SPHelper.sp(SPHelper.fontSp15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    topRadius: true,
                    bottomRadius: true,
                    leading: const Icon(
                      Icons.access_time_filled,
                      size: 28,
                    ),
                    trailing: Row(
                      children: List.generate(
                        7,
                        (index) => const SleekCounter(
                          min: 0,
                          max: 10,
                          sm: true,
                          value: 7,
                          fail: false,
                          abandon: true,
                        ),
                      ),
                    ),
                    id: '',
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class Abandon extends StatefulWidget {
  const Abandon({super.key});

  @override
  State<StatefulWidget> createState() => _AbandonState();
}

class _AbandonState extends State<Abandon> {
  late bool expand;

  @override
  void initState() {
    super.initState();
    expand = true;
  }

  @override
  void dispose() {
    expand = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: expand ? 1 : 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: HabitHomeTile(
                  title: '八段锦八段锦',
                  abandon: true,
                  subTitle: Column(
                    children: [
                      SPHelper.getHeightBox(SPHelper.gapDp4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.timer,
                            size: SPHelper.sp(SPHelper.fontSp18),
                            color: CupertinoColors.systemGrey2,
                          ),
                          SPHelper.getWidthBox(SPHelper.gapDp8),
                          Text(
                            '每天',
                            style: TextStyle(
                              color: CupertinoColors.systemGrey2,
                              fontSize: SPHelper.sp(SPHelper.fontSp15),
                            ),
                          ),
                        ],
                      ),
                      SPHelper.getHeightBox(SPHelper.gapDp4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.app_badge,
                            size: SPHelper.sp(SPHelper.fontSp18),
                            color: CupertinoColors.systemGrey2,
                          ),
                          SPHelper.getWidthBox(SPHelper.gapDp8),
                          Text(
                            '08:00',
                            style: TextStyle(
                              color: CupertinoColors.systemGrey2,
                              fontSize: SPHelper.sp(SPHelper.fontSp15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  topRadius: true,
                  bottomRadius: true,
                  leading: const Icon(
                    Icons.access_time_filled,
                    size: 28,
                  ),
                  trailing: Row(
                    children: List.generate(
                      7,
                      (index) => const SleekCounter(
                        min: 0,
                        max: 10,
                        sm: true,
                        value: 7,
                        fail: false,
                        abandon: true,
                      ),
                    ),
                  ),
                  id: '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
