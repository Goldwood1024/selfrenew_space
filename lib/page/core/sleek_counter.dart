import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class SleekCounter extends StatefulWidget {
  final double min;
  final double max;
  final double value;
  final bool fail;
  final bool sm;

  const SleekCounter({
    super.key,
    required this.min,
    required this.max,
    this.value = 1,
    this.fail = false,
    this.sm = false,
  });

  @override
  State<StatefulWidget> createState() => _SleekCounterState();
}

class _SleekCounterState extends State<SleekCounter> {
  double data = 0.0;

  @override
  void initState() {
    super.initState();
    data = widget.value / 10;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            if (data < 1) {
              data += 0.1;
            }

            if (data >= 1) {
              data = 1;
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
                    width: widget.sm ? 24 : 28,
                    height: widget.sm ? 24 : 28,
                    child: Icon(
                      CupertinoIcons.clear_circled_solid,
                      size: widget.sm ? 26 : 30,
                    ),
                  )
                : (widget.value ~/ widget.max >= 1
                    ? SizedBox(
                        width: widget.sm ? 24 : 28,
                        height: widget.sm ? 24 : 28,
                        child: Icon(
                          CupertinoIcons.checkmark_circle_fill,
                          size: widget.sm ? 26 : 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          const Text(
                            '日',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: CupertinoColors.systemGrey4,
                            ),
                          ),
                          CircularPercentIndicator(
                            radius: widget.sm ? 12 : 14,
                            animation: true,
                            lineWidth: 3,
                            backgroundWidth: 2,
                            backgroundColor: CupertinoColors.systemGrey4,
                            percent: data,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Theme.of(context).primaryColor,
                          )
                        ],
                      )),
          ),
        ));
  }
}
