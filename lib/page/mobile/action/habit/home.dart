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
            titleStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
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
            titleStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
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
          title: '习惯',
        ),
        leadingWidth: SPHelper.leadingWidth,
        leading: BackBtn(
          title: '概览',
          onPressed: () {
            Routers.pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_suggest,
            ),
          )
        ],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            HabitTile(
              title: '八段锦',
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.bell,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
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
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
            SPHelper.getHeightBox(2),
            HabitTile(
              title: '八段锦',
              topRadius: true,
              bottomRadius: true,
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
            SPHelper.getHeightBox(2),
            HabitTile(
              title: '八段锦',
              topRadius: true,
              bottomRadius: true,
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
            SPHelper.getHeightBox(2),
            HabitTile(
              title: '八段锦',
              topRadius: true,
              bottomRadius: true,
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
            SPHelper.getHeightBox(36),
            Text(
              '已放弃',
              style: TextStyle(
                fontSize: SPHelper.sp(SPHelper.fontSp16),
                fontWeight: FontWeight.w600,
                color: CupertinoColors.systemGrey,
              ),
            ),
            SPHelper.getHeightBox(18),
            HabitTile(
              title: '八段锦',
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              bottomRadius: true,
              topRadius: true,
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
