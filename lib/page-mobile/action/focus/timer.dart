import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusTimer extends StatefulWidget {
  final Map<String, dynamic> params;

  const FocusTimer({
    super.key,
    required this.params,
  });

  @override
  State<StatefulWidget> createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer>
    with SingleTickerProviderStateMixin {
  late Duration time;
  late bool _hideTimeText;

  @override
  void initState() {
    super.initState();
    _hideTimeText = false;
    time = const Duration(seconds: 0);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusTimerProvider update = Provider.of(context, listen: false);
      update.timer(widget.params);

      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _hideTimeText = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _hideTimeText = false;
    super.dispose();
  }

  String getTime(FocusTimerProvider provider) {
    Duration duration = Duration(seconds: provider.timers);
    if (duration.compareTo(time) >= 0 && time.compareTo(Duration.zero) != 0) {
      return DatetimeUtil.getTime(time);
    }

    if (provider.timers > 0) {
      return DatetimeUtil.getTime(duration);
    }

    return DatetimeUtil.getTime(time);
  }

  bool show(FocusTimerProvider provider, FocusType focus) {
    if (ObjectUtil.isEmpty(provider.focusType)) {
      return false;
    }
    return provider.focusType == focus.name;
  }

  @override
  Widget build(BuildContext context) {
    FocusTimerProvider focusTimerProvider = Provider.of(context);
    FocusTimerProvider update = Provider.of(context, listen: false);

    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.appBarHeight(),
        centerTitle: true,
        title: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconVisible(
                  visible: show(focusTimerProvider, FocusType.tomato),
                  icon: Icons.timer,
                ),
                IconVisible(
                  visible: show(focusTimerProvider, FocusType.uptime),
                  icon: CupertinoIcons.loop,
                ),
                IconVisible(
                  visible: show(focusTimerProvider, FocusType.downtime),
                  icon: CupertinoIcons.timer,
                ),
                SPHelper.getWidthBox(SPHelper.gapDp12),
                Text(
                  focusTimerProvider.title,
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.fontSp18),
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.labelSmall?.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 5,
              child: Visibility(
                visible: _hideTimeText,
                replacement: Text(
                  getTime(focusTimerProvider),
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.gapDp72),
                    color: Theme.of(context).textTheme.labelSmall?.color,
                  ),
                ),
                child: SlideCountdown(
                  shouldShowDays: (_) {
                    return false;
                  },
                  shouldShowHours: (_) {
                    return false;
                  },
                  showZeroValue: true,
                  padding: EdgeInsets.zero,
                  countUp: focusTimerProvider.countUp,
                  infinityCountUp: focusTimerProvider.infinityCountUp,
                  curve: Curves.linear,
                  separatorType: SeparatorType.symbol,
                  decoration: const BoxDecoration(),
                  duration: Duration(seconds: focusTimerProvider.getTimers()),
                  slideAnimationDuration: const Duration(milliseconds: 500),
                  textStyle: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.gapDp72),
                    color: Theme.of(context).textTheme.labelSmall?.color,
                  ),
                  onChanged: (_) async {
                    setState(() {
                      time = _;
                    });

                    if (_.inMilliseconds <= 500) {
                      SmartDialog.dismiss();

                      await SqliteProxy.focusRepository
                          .insertFocusClick(
                        1,
                        focusTimerProvider.timers,
                        DatetimeUtil.nowDateYMD(),
                        focusTimerProvider.id,
                      );

                      // 番茄钟弹出
                      if (focusTimerProvider.focusType ==
                          FocusType.tomato.name) {
                        if (focusTimerProvider.skipRelax == 1) {
                          return;
                        }

                        int count =
                            await SqliteProxy.focusRepository.selectClickById(
                          DatetimeUtil.nowDateYMD(),
                          focusTimerProvider.id,
                        );

                        int times = 0;
                        if (count == 0) {
                          times = focusTimerProvider.shortRelaxTime;
                        } else {
                          if (count % focusTimerProvider.longRelaxInterval ==
                              0) {
                            times = focusTimerProvider.longRelaxTime;
                          } else {
                            times = focusTimerProvider.shortRelaxTime;
                          }
                        }

                        SmartDialog.show(
                          alignment: Alignment.bottomCenter,
                          keepSingle: true,
                          useAnimation: true,
                          builder: (_) {
                            return FocusRelax(
                              params: {
                                "timer": times,
                                "musicId": 1,
                                "autoRelax": focusTimerProvider.autoRelax == 1,
                              },
                            );
                          },
                        );
                      } else {
                        BottomDialog.show(
                          context,
                          const FocusCompleted(),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
            Positioned(
              bottom: SPHelper.height(SPHelper.gapDp100),
              child: Align(
                child: ActionSlider.standard(
                  width: SPHelper.width(SPHelper.gapDp200),
                  height: SPHelper.height(SPHelper.gapDp52),
                  icon: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: SPHelper.sp(SPHelper.gapDp32),
                    color: Colors.white,
                  ),
                  successIcon: Icon(
                    Icons.check_rounded,
                    size: SPHelper.sp(SPHelper.gapDp32),
                    color: Colors.white,
                  ),
                  boxShadow: [],
                  backgroundColor: CupertinoColors.systemFill,
                  loadingIcon: const SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: Colors.white,
                    ),
                  ),
                  child: Text(
                    '滑动放弃',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGrey2,
                      fontSize: SPHelper.sp(SPHelper.gapDp14),
                    ),
                  ),
                  action: (controller) async {
                    controller.loading();
                    setState(() {
                      _hideTimeText = false;
                    });

                    await Future.delayed(const Duration(milliseconds: 300));
                    controller.success();
                    await Future.delayed(const Duration(milliseconds: 1300));
                    SmartDialog.dismiss();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
