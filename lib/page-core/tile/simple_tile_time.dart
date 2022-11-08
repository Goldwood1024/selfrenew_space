import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class SimpleTileTime extends StatefulWidget {
  final double height;
  final double radius;
  final int max;
  final int min;
  final int initValue;
  final bool bottomRadius;
  final bool topRadius;
  final bool showArrow;
  final bool showDivider;
  final bool hide;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final Function(dynamic)? onValueChanged;

  const SimpleTileTime({
    super.key,
    this.height = 52.0,
    this.radius = 12.0,
    this.max = 100,
    this.min = 1,
    this.initValue = 1,
    this.bottomRadius = false,
    this.topRadius = false,
    this.hide = false,
    this.showArrow = true,
    this.showDivider = true,
    this.trailing,
    this.onPressed,
    this.onValueChanged,
  });

  @override
  State<StatefulWidget> createState() => _SimpleTileTimeState();
}

class _SimpleTileTimeState extends State<SimpleTileTime> {
  late bool expand;

  @override
  void initState() {
    super.initState();
    expand = false;
  }

  @override
  Widget build(BuildContext context) {
    return widget.hide
        ? SPHelper.empty
        : Column(
            children: [
              !expand
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          expand = !expand;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: widget.height,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: widget.topRadius
                                  ? Radius.circular(widget.radius)
                                  : const Radius.circular(0),
                              topRight: widget.topRadius
                                  ? Radius.circular(widget.radius)
                                  : const Radius.circular(0),
                              bottomLeft: expand
                                  ? const Radius.circular(0)
                                  : widget.bottomRadius
                                      ? Radius.circular(widget.radius)
                                      : const Radius.circular(0),
                              bottomRight: expand
                                  ? const Radius.circular(0)
                                  : widget.bottomRadius
                                      ? Radius.circular(widget.radius)
                                      : const Radius.circular(0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '新增',
                                    style: TextStyle(
                                      fontSize: SPHelper.sp(
                                        SPHelper.fontSp18,
                                      ),
                                      color: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .color,
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(child: SPHelper.empty),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SPHelper.empty,
              expand
                  ? Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(widget.radius),
                          bottomRight: Radius.circular(widget.radius),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              onTimerDurationChanged: (Duration value) {},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ActionBtn(
                                  title: '关闭',
                                  onPressed: () {
                                    setState(() {
                                      expand = false;
                                    });
                                  },
                                ),
                                ActionBtn(
                                  title: '确定',
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : SPHelper.empty,
            ],
          );
  }
}
