import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:slide_countdown/slide_countdown.dart';

class FocusRelax extends StatefulWidget {
  final Map<String, dynamic> params;

  const FocusRelax({
    super.key,
    required this.params,
  });

  @override
  State<StatefulWidget> createState() => _FocusRelaxState();
}

class _FocusRelaxState extends State<FocusRelax>
    with SingleTickerProviderStateMixin {
  late Duration time;
  late bool showText;
  late bool _hideStart;

  @override
  void initState() {
    super.initState();
    showText = false;
    _hideStart = false;

    time = Duration(seconds: widget.params['timer']);
    showText = widget.params['autoRelax'];
    if (showText) {
      _hideStart = true;
    }
  }

  @override
  void dispose() {
    showText = false;
    _hideStart = false;
    super.dispose();
  }

  String getTime() {
    return DatetimeUtil.getTime(time);
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
                Text(
                  '放松一下',
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
                visible: showText,
                replacement: Text(
                  getTime(),
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.gapDp72),
                    color: Theme.of(context).textTheme.labelSmall?.color,
                  ),
                ),
                child: SlideCountdown(
                  showZeroValue: true,
                  shouldShowDays: (_) {
                    return false;
                  },
                  shouldShowHours: (_) {
                    return false;
                  },
                  padding: EdgeInsets.zero,
                  countUp: false,
                  infinityCountUp: false,
                  curve: Curves.linear,
                  separatorType: SeparatorType.symbol,
                  slideDirection: SlideDirection.down,
                  decoration: const BoxDecoration(),
                  duration: time,
                  slideAnimationDuration: const Duration(milliseconds: 500),
                  textStyle: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.gapDp72),
                    color: Theme.of(context).textTheme.labelSmall?.color,
                  ),
                  onDone: () {
                    // SmartDialog.dismiss();
                  },
                  onChanged: (_) {
                    setState(() {
                      time = _;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: SPHelper.height(SPHelper.gapDp100),
              child: Align(
                child: Visibility(
                  visible: _hideStart,
                  replacement: Column(
                    children: [
                      StartRelax(
                        onPressed: () {
                          setState(() {
                            showText = true;
                            _hideStart = true;
                          });
                        },
                      ),
                      SPHelper.getDefaultHeightBox(),
                      SkipRelax(
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 300), () {
                            SmartDialog.dismiss();
                          });
                        },
                      )
                    ],
                  ),
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
                      '滑动终止休息',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.systemGrey2,
                        fontSize: SPHelper.sp(SPHelper.gapDp14),
                      ),
                    ),
                    action: (controller) async {
                      controller.loading();
                      setState(() {
                        showText = false;
                      });

                      await Future.delayed(const Duration(milliseconds: 300));
                      controller.success();
                      await Future.delayed(const Duration(milliseconds: 1300));
                      SmartDialog.dismiss();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
