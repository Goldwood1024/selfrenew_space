import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
              stretch: true,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                  width: 0.0, // 0.0 means one physical pixel
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
                      bottomRadius: true,
                      title: '冥想',
                      leading: Container(
                        child: SvgPicture.asset(
                          'assets/icons/浴盆.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      // trailing: const Icon(
                      //   Icons.check_circle,
                      //   size: 28,
                      // ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            size: 26,
                            spinnerMode: true,
                            counterClockwise: true,
                            animationEnabled: false,
                            startAngle: 0,
                            angleRange: 270,
                            customColors: CustomSliderColors(
                              dotColor: Colors.transparent,
                              hideShadow: true,
                              dynamicGradient: false,
                            ),
                            customWidths: CustomSliderWidths(
                              trackWidth: 3,
                              progressBarWidth: 3,
                              handlerSize: 0,
                            ),
                          ),
                          min: 0,
                          max: 10,
                          initialValue: 2,
                          innerWidget: (_) {
                            return SPHelper.empty;
                          },
                        ),
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
