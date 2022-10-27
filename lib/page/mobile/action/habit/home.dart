import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class HabitHome extends StatefulWidget {
  const HabitHome({super.key});

  @override
  State<StatefulWidget> createState() => _HabitHomeState();
}

class _HabitHomeState extends State<HabitHome> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      floatingActionButton: FloatingActionBubble(
        items: [
          Bubble(
            title: "消灭坏习惯",
            iconColor: Colors.white,
            bubbleColor: Theme.of(context).primaryColor,
            icon: CupertinoIcons.nosign,
            titleStyle: TextStyleMode.floatBubbleTextStyle(context),
            onPress: () {
              _animationController.reverse();
              Routers.go(Routers.habitSelect);
            },
          ),
          Bubble(
            title: "创建好习惯",
            iconColor: Colors.white,
            bubbleColor: Theme.of(context).primaryColor,
            icon: CupertinoIcons.loop,
            titleStyle: TextStyleMode.floatBubbleTextStyle(context),
            onPress: () {
              _animationController.reverse();
              Routers.go(Routers.habitSelect);
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
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '习惯',
        ),
        leadingWidth: SPHelper.leadingWidth,
        leading: BackBtn(
          title: '计划',
          onPressed: () {
            Routers.pop();
          },
        ),
        actions: [
          ActionIconBtn(
            icon: const Icon(
              CupertinoIcons.slider_horizontal_3,
            ),
            onPressed: () {
              BottomDialog.showModalBottomSheet(
                context,
                ScaffoldGradientBackground(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const AppBarText(
                      title: '设置',
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
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            Underway(),
            SPHelper.getHeightBox(36),
            Abandon()
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
  late bool show;

  @override
  void initState() {
    super.initState();

    show = false;
  }

  @override
  Widget build(BuildContext context) {
    return show
        ? Column(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                        value: 11,
                        fail: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Align(
                  child: SvgPicture.asset(
                    'assets/icons/habit.svg',
                    height: 200,
                  ),
                ),
                Text(
                  '没有习惯，快添加习惯吧',
                  style: TextStyleMode.tipTextStyle(context),
                )
              ],
            ),
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
    expand = false;
  }

  @override
  void dispose() {
    expand = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '已放弃',
                style: TextStyle(
                  fontSize: SPHelper.sp(SPHelper.fontSp16),
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                child: Container(
                  width: 40,
                  height: 20,
                  alignment: Alignment.centerRight,
                  child: expand
                      ? Icon(
                          Icons.keyboard_arrow_down,
                          size: 28,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          Icons.keyboard_arrow_right,
                          size: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                ),
              )
            ],
          ),
          SPHelper.getHeightBox(SPHelper.gapDp12),
          Column(
            children: List.generate(
              expand ? 10 : 0,
              (index) => Container(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
