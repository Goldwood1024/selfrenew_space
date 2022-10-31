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
                  child: Icon(
                    CupertinoIcons.clear_circled_solid,
                    size: widget.sm
                        ? SPHelper.width(SPHelper.gapDp26)
                        : SPHelper.width(SPHelper.gapDp30),
                  ),
                )
              : (value == widget.max
                  ? SizedBox(
                      width: widget.sm
                          ? SPHelper.width(SPHelper.fontSp24)
                          : SPHelper.width(SPHelper.gapDp28),
                      height: widget.sm
                          ? SPHelper.width(SPHelper.fontSp24)
                          : SPHelper.width(SPHelper.gapDp28),
                      child: Icon(
                        CupertinoIcons.checkmark_circle_fill,
                        size: widget.sm
                            ? SPHelper.width(SPHelper.gapDp28)
                            : SPHelper.width(SPHelper.gapDp30),
                        color: widget.abandon
                            ? CupertinoColors.black.withOpacity(0.5)
                            : Theme.of(context).primaryColor,
                      ),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          widget.day.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SPHelper.sp(SPHelper.fontSp12),
                            color: CupertinoColors.systemGrey4,
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: widget.sm ? 12 : 13.4,
                          animation: false,
                          lineWidth: 3,
                          backgroundWidth: 3,
                          backgroundColor: CupertinoColors.systemGrey4,
                          percent: value / widget.max,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: widget.abandon
                              ? CupertinoColors.black.withOpacity(0.5)
                              : Theme.of(context).primaryColor,
                        )
                      ],
                    )),
        ),
      ),
    );
  }
}
