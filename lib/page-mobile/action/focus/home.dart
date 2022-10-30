import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/core/tile/focus_home_tile.dart';

class FocusHome extends StatefulWidget {
  const FocusHome({super.key});

  @override
  State<StatefulWidget> createState() => _FocusHomeState();
}

class _FocusHomeState extends State<FocusHome> with TickerProviderStateMixin {
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
            title: "番茄钟",
            iconColor: Colors.white,
            bubbleColor: Theme.of(context).primaryColor,
            icon: Icons.timer,
            titleStyle: TextStyleMode.floatBubbleTextStyle(context),
            onPress: () {
              _animationController.reverse();
              Routers.go(Routers.focusForm);
            },
          ),
          Bubble(
            title: "正计时",
            iconColor: Colors.white,
            bubbleColor: Theme.of(context).primaryColor,
            icon: CupertinoIcons.loop,
            titleStyle: TextStyleMode.floatBubbleTextStyle(context),
            onPress: () {
              _animationController.reverse();
            },
          ),
          Bubble(
            title: "倒计时",
            iconColor: Colors.white,
            bubbleColor: Theme.of(context).primaryColor,
            icon: CupertinoIcons.timer,
            titleStyle: TextStyleMode.floatBubbleTextStyle(context),
            onPress: () {
              _animationController.reverse();
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
          title: '专注',
        ),
        leadingWidth: SPHelper.leadingWidth,
        leading: BackBtn(
          title: '概览',
          onPressed: () {
            Routers.pop();
          },
        ),
        actions: [],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            FocusUnderway(),
          ],
        ),
      ),
    );
  }
}

class FocusUnderway extends StatefulWidget {
  const FocusUnderway({super.key});

  @override
  State<StatefulWidget> createState() => _FocusUnderwayState();
}

class _FocusUnderwayState extends State<FocusUnderway>
    with TickerProviderStateMixin {
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
                child: FocusHomeTile(
                  title: '八段锦',
                  subTitle: Column(
                    children: [
                      Row(
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
                    children: [
                      GestureDetector(
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
                    ],
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
                    'assets/icons/focus.svg',
                    height: 200,
                  ),
                ),
                Text(
                  '没有专注，快添加任务吧',
                  style: TextStyleMode.tipTextStyle(context),
                )
              ],
            ),
          );
  }
}
