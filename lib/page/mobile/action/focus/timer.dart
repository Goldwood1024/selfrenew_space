import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
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
  late bool selected;

  @override
  void initState() {
    super.initState();
    selected = false;
  }

  @override
  void dispose() {
    selected = false;
    super.dispose();
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
                const Icon(
                  CupertinoIcons.loop,
                  size: 32,
                ),
                SPHelper.getWidthBox(12),
                Text(
                  '同意方法',
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.fontSp18),
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.displayLarge?.color,
                  ),
                ),
              ],
            ),
            // Positioned(
            //   right: 12,
            //   child: const Icon(
            //     CupertinoIcons.loop,
            //     size: 32,
            //   ),
            // )
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
              child: SlideCountdown(
                padding: EdgeInsets.zero,
                countUp: false,
                infinityCountUp: false,
                separatorType: SeparatorType.symbol,
                slideDirection: SlideDirection.down,
                decoration: const BoxDecoration(),
                duration: const Duration(minutes: 24),
                slideAnimationDuration: const Duration(milliseconds: 500),
                textStyle: TextStyle(
                  fontSize: 72,
                  color: Theme.of(context).textTheme.displayLarge?.color,
                ),
                onDone: () {},
              ),
            ),
            Positioned(
              bottom: 140,
              child: Align(
                child: ActionSlider.standard(
                  width: 200.0,
                  height: 52,
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                  successIcon: const Icon(
                    Icons.check_rounded,
                    size: 32,
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
                  child: const Text(
                    '滑动放弃',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGrey2,
                      fontSize: 14,
                    ),
                  ),
                  action: (controller) async {
                    controller.loading();
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
