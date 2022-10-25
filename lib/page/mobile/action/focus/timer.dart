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
        title: const Icon(
          CupertinoIcons.loop,
          size: 30,
        ),
        actions: [],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Align(
                child: Text(
                  '同意方法',
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.fontSp18),
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.displayLarge?.color,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 5,
              child: SlideCountdown(
                separatorType: SeparatorType.symbol,
                slideDirection: SlideDirection.up,
                decoration: const BoxDecoration(),
                duration: const Duration(minutes: 25),
                textStyle: TextStyle(
                  fontSize: 56,
                  color: Theme.of(context).textTheme.displayLarge?.color,
                ),
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
                  backgroundColor: CupertinoColors.systemGrey4,
                  child: const Text(
                    '滑动放弃',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGrey2,
                      fontSize: 16,
                    ),
                  ),
                  action: (controller) async {
                    controller.loading();
                    await Future.delayed(const Duration(milliseconds: 500));
                    controller.success();
                    await Future.delayed(const Duration(seconds: 2));
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
