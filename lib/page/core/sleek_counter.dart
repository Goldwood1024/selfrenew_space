import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class SleekCounter extends StatefulWidget {
  final double min;
  final double max;
  final double value;
  final bool fail;

  const SleekCounter({
    super.key,
    required this.min,
    required this.max,
    this.value = 1,
    this.fail = false,
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
        child: widget.fail
            ? const SizedBox(
                width: 28,
                height: 28,
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  size: 30,
                ),
              )
            : (widget.value ~/ widget.max >= 1
                ? SizedBox(
                    width: 28,
                    height: 28,
                    child: Icon(
                      CupertinoIcons.checkmark_circle_fill,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : CircularPercentIndicator(
                    radius: 14,
                    backgroundWidth: 3,
                    animation: true,
                    lineWidth: 3,
                    percent: data,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).primaryColor,
                  )),
      ),
    );
  }
}
