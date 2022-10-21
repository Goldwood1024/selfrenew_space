import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class Habit extends StatefulWidget {
  const Habit({super.key});

  @override
  State<StatefulWidget> createState() => _HabitState();
}

class _HabitState extends State<Habit> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      floatingActionButton: FloatingActionBubble(
        items: [
          Bubble(
            title: "消灭坏习惯",
            iconColor: Theme.of(context).primaryColor,
            bubbleColor: Colors.white,
            icon: Icons.home,
            titleStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
            onPress: () {
              _animationController.reverse();
            },
          ),
          Bubble(
            title: "创建好习惯",
            iconColor: Theme.of(context).primaryColor,
            bubbleColor: Colors.white,
            icon: Icons.home,
            titleStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
            onPress: () {
              _animationController.reverse();
            },
          ),
        ],
        onPress: () {
          // SmartDialog.show(
          //   onDismiss: () {
          //     _animationController.isCompleted
          //         ? _animationController.reverse()
          //         : _animationController.forward();
          //   },
          //   builder: (_) {
          //     return Container();
          //   },
          // );

          _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward();
        },
        iconColor: Colors.blue,
        iconData: Icons.add,
        backGroundColor: Colors.white,
        animation: _animation,
      ),
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '习惯',
        ),
        actions: [],
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
