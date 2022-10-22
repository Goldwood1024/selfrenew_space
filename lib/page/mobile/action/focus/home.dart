import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

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
            iconColor: Theme.of(context).primaryColor,
            bubbleColor: Colors.white,
            icon: Icons.timer,
            titleStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
            onPress: () {
              _animationController.reverse();
              Routers.go(Routers.focusForm);
            },
          ),
          Bubble(
            title: "正计时",
            iconColor: Theme.of(context).primaryColor,
            bubbleColor: Colors.white,
            icon: CupertinoIcons.loop,
            titleStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
            onPress: () {
              _animationController.reverse();
            },
          ),
          Bubble(
            title: "倒计时",
            iconColor: Theme.of(context).primaryColor,
            bubbleColor: Colors.white,
            icon: CupertinoIcons.timer,
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
                        Icons.loop,
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
                    Icons.pause_circle_outline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
