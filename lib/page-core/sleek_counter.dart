import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class SleekCounter extends StatefulWidget {
  final double min;
  final double max;
  final double value;
  final bool fail;
  final bool sm;
  final bool abandon;
  final int day;

  const SleekCounter({
    super.key,
    required this.min,
    required this.max,
    this.value = 1,
    this.fail = false,
    this.sm = false,
    this.abandon = false,
    this.day = 1,
  });

  @override
  State<StatefulWidget> createState() => _SleekCounterState();
}

class _SleekCounterState extends State<SleekCounter> {
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          if (widget.abandon) {
            return;
          }

          if (value++ / widget.max >= 1) {
            value = widget.max;
          }
        });
      },
      child: Align(
        child: Padding(
          padding: widget.sm
              ? const EdgeInsets.fromLTRB(1, 0, 1, 0)
              : EdgeInsets.zero,
          child: widget.fail
              ? SizedBox(
                  width: widget.sm
                      ? SPHelper.width(SPHelper.fontSp24)
                      : SPHelper.width(SPHelper.gapDp28),
                  height: widget.sm
                      ? SPHelper.width(SPHelper.fontSp24)
                      : SPHelper.width(SPHelper.gapDp28),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey4,
                      borderRadius: BorderRadius.circular(
                        SPHelper.gapDp120,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/delete.svg',
                      color: Colors.white,
                    ),
                  ),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    value == widget.max
                        ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: widget.abandon
                                  ? CupertinoColors.black.withOpacity(0.5)
                                  : Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(200),
                            ),
                            width: widget.sm
                                ? SPHelper.width(SPHelper.fontSp24)
                                : SPHelper.width(SPHelper.gapDp28),
                            height: widget.sm
                                ? SPHelper.width(SPHelper.fontSp24)
                                : SPHelper.width(SPHelper.gapDp28),
                            child: Container(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/icons/check.svg',
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                widget.day.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: SPHelper.sp(SPHelper.fontSp14),
                                  color: CupertinoColors.systemGrey4,
                                ),
                              ),
                              CircularPercentIndicator(
                                radius: widget.sm
                                    ? SPHelper.sp(SPHelper.fontSp12)
                                    : SPHelper.sp(SPHelper.fontSp134),
                                lineWidth: SPHelper.width(SPHelper.gapDp3),
                                backgroundWidth:
                                    SPHelper.width(SPHelper.gapDp3),
                                backgroundColor: CupertinoColors.systemGrey4,
                                percent: value / widget.max,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: widget.abandon
                                    ? CupertinoColors.black.withOpacity(0.5)
                                    : Theme.of(context).primaryColor,
                              )
                            ],
                          )
                  ],
                ),
        ),
      ),
    );
  }
}
