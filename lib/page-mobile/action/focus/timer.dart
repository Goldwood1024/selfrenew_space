import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:slide_countdown/slide_countdown.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer>
    with SingleTickerProviderStateMixin {
  late Duration time;
  late bool showText;

  @override
  void initState() {
    super.initState();
    showText = false;
  }

  @override
  void dispose() {
    showText = false;
    super.dispose();
  }

  String getTime() {
    return '${time.inMinutes}:${time.inSeconds % 60}';
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.appBarHeight(),
        centerTitle: true,
        title: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.loop,
                  size: SPHelper.sp(SPHelper.gapDp30),
                  color: Theme.of(context).textTheme.labelSmall?.color,
                ),
                SPHelper.getWidthBox(12),
                Text(
                  '同意方法',
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
              child: showText
                  ? Text(
                      getTime(),
                      style: TextStyle(
                        fontSize: SPHelper.sp(SPHelper.gapDp72),
                        color: Theme.of(context).textTheme.displayLarge?.color,
                      ),
                    )
                  : SlideCountdown(
                      padding: EdgeInsets.zero,
                      countUp: false,
                      infinityCountUp: false,
                      curve: Curves.linear,
                      separatorType: SeparatorType.symbol,
                      slideDirection: SlideDirection.down,
                      decoration: const BoxDecoration(),
                      duration: const Duration(minutes: 24),
                      slideAnimationDuration: const Duration(milliseconds: 500),
                      textStyle: TextStyle(
                        fontSize: SPHelper.sp(SPHelper.gapDp72),
                        color: Theme.of(context).textTheme.displayLarge?.color,
                      ),
                      onDone: () {},
                      onChanged: (_) {
                        setState(() {
                          time = _;
                        });
                      },
                    ),
            ),
            Positioned(
              bottom: 140,
              child: Align(
                child: ActionSlider.standard(
                  width: 200.0,
                  height: 52,
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
                      showText = true;
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
