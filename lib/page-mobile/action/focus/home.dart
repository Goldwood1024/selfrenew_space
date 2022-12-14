import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

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
    super.initState();

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FocusProvider>(context, listen: false).reloadFocusHome();
    });
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
              Routers.pushParams(Routers.focusForm, {
                "type": FocusType.tomato.name,
              });
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
              Routers.pushParams(Routers.focusForm, {
                "type": FocusType.uptime.name,
              });
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
              Routers.pushParams(Routers.focusForm, {
                "type": FocusType.downtime.name,
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
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '专注',
        ),
        leadingWidth: SPHelper.leadingWidth,
        leading: BackBtn(
          title: '计划',
          onPressed: () {
            Routers.goParams(Routers.mobileHome, {});
          },
        ),
        actions: [],
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: ListView(
            children: [
              SPHelper.getDefaultHeightBox(),
              const FocusUnderway(),
            ],
          ),
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
  @override
  void initState() {
    super.initState();
  }

  static String getTargetTimeText(int targetTime) {
    int minutes = targetTime ~/ 60;

    String text = '';
    int hours = minutes ~/ 60;
    if (hours > 0) {
      text += ('$hours小时');
    }

    int minute = minutes % 60;
    if (minute > 0) {
      text += ('$minute分');
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    FocusProvider focusProvider = Provider.of(context);
    FocusProvider update = Provider.of(context, listen: false);
    List<FocusUnderwayModel> data = focusProvider.getFocusUnderway();
    return Visibility(
      visible: focusProvider.hasUnderway(),
      replacement: const ImageDefaultEmpty(
        title: '没有专注，快添加任务吧！',
        imagePath: 'assets/icons/focus.svg',
      ),
      child: Column(
        children: List.generate(data.length, (index) {
          FocusUnderwayModel model = data[index];
          IconData icon;

          if (model.type == FocusType.tomato.name) {
            icon = Icons.timer;
          } else if (model.type == FocusType.uptime.name) {
            icon = CupertinoIcons.loop;
          } else {
            icon = CupertinoIcons.timer;
          }

          return Padding(
            padding:
                EdgeInsets.fromLTRB(0, SPHelper.height(SPHelper.gapDp8), 0, 0),
            child: FocusHomeTile(
              onRemove: () async {
                await update.remove(model);
              },
              onEdit: () {
                Routers.pushParams(Routers.focusForm, {
                  'id': model.id,
                  'type': model.type,
                });
              },
              title: model.title,
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        size: SPHelper.sp(SPHelper.fontSp18),
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(SPHelper.gapDp8),
                      Text(
                        getTargetTimeText(model.targetTime),
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                          fontSize: SPHelper.sp(SPHelper.fontSp15),
                        ),
                      ),
                    ],
                  ),
                  // SPHelper.getHeightBox(SPHelper.gapDp4),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Icon(
                  //       CupertinoIcons.app_badge,
                  //       size: SPHelper.sp(SPHelper.fontSp18),
                  //       color: CupertinoColors.systemGrey2,
                  //     ),
                  //     SPHelper.getWidthBox(SPHelper.gapDp8),
                  //     Text(
                  //       '08:00',
                  //       style: TextStyle(
                  //         color: CupertinoColors.systemGrey2,
                  //         fontSize: SPHelper.sp(SPHelper.fontSp15),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              topRadius: true,
              bottomRadius: true,
              leading: SvgLoader(
                path: data[index].iconModel.icon,
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
                          return FocusTimer(
                            params: {
                              'id': model.id,
                            },
                          );
                        },
                      );
                    },
                    behavior: HitTestBehavior.translucent,
                    child: SvgColorLoader(
                      path: 'assets/icons/start.svg',
                      size: SPHelper.sp(SPHelper.gapDp28),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
