import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  double i = 0;
  late CustomPopupMenuController controller;

  @override
  void initState() {
    super.initState();
    i = 0;
    controller = CustomPopupMenuController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
              // leading: Padding(
              //   padding: const EdgeInsets.fromLTRB(18, 10, 0, 0),
              //   child: Text(
              //     '星期五',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.normal,
              //       color: Theme.of(context).primaryColor,
              //     ),
              //   ),
              // ),
              largeTitle: const Text(
                '概要',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              // trailing: CustomPopupMenu(
              //   controller: controller,
              //   arrowColor: Colors.white,
              //   showArrow: false,
              //   verticalMargin: 0,
              //   horizontalMargin: 14,
              //   menuBuilder: () => ClipRRect(
              //     borderRadius: BorderRadius.circular(8),
              //     child: Container(
              //       color: Colors.white,
              //       child: IntrinsicWidth(
              //         stepWidth: 200,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             GestureDetector(
              //               behavior: HitTestBehavior.translucent,
              //               onTap: () {
              //                 controller.hideMenu();
              //                 BottomDialog.showModalBottomSheet(
              //                   context,
              //                   MobileFunc(),
              //                 );
              //               },
              //               child: Container(
              //                 height: 46,
              //                 color: Colors.white,
              //                 alignment: Alignment.center,
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceAround,
              //                   children: const [
              //                     Icon(CupertinoIcons.layers_alt),
              //                     Text(
              //                       '功能模块',
              //                       style: TextStyle(
              //                         fontSize: 16,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             const Divider(),
              //             GestureDetector(
              //               behavior: HitTestBehavior.translucent,
              //               onTap: () {
              //                 print("onTap");
              //               },
              //               child: Container(
              //                 height: 46,
              //                 color: Colors.white,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              //   pressType: PressType.singleClick,
              //   child: Container(
              //     child: const Icon(
              //       Icons.more_horiz,
              //     ),
              //   ),
              // ),
              trailing: ActionIconBtn(
                icon: const Icon(
                  Icons.more_horiz_sharp,
                ),
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    MobileActionBottom(),
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
