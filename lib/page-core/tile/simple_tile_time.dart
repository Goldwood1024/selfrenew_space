import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class SimpleTileTime extends StatefulWidget {
  final double height;
  final double radius;
  final bool topRadius;
  final bool bottomRadius;
  final bool showBtn;
  final DateTime dateTime;
  final bool showDivider;
  final VoidCallback? onPressed;
  final Function(DateTime)? onValueChanged;
  final Function(DateTime)? onRemoved;

  const SimpleTileTime({
    super.key,
    required this.dateTime,
    this.onValueChanged,
    this.onRemoved,
    this.height = 52.0,
    this.radius = 12.0,
    this.topRadius = false,
    this.bottomRadius = false,
    this.showBtn = false,
    this.showDivider = true,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _SimpleTileTimeState();
}

class _SimpleTileTimeState extends State<SimpleTileTime> {
  late bool expand;
  late DateTime current;

  @override
  void initState() {
    super.initState();
    expand = false;
    current = widget.dateTime;
  }

  String getTimer() {
    return DatetimeUtil.getHorTime(widget.dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        bottomLeft: widget.bottomRadius
                            ? Radius.circular(widget.radius)
                            : const Radius.circular(0),
                        bottomRight: widget.bottomRadius
                            ? Radius.circular(widget.radius)
                            : const Radius.circular(0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                          child: widget.showBtn
                              ? const Icon(Icons.timer_sharp)
                              : Icon(
                                  Icons.add_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.showBtn ? getTimer() : '新增',
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
                        widget.showBtn
                            ? GestureDetector(
                                onTap: () {
                                  widget.onRemoved!(widget.dateTime);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 14, 0),
                                  child: Icon(
                                    Icons.close,
                                  ),
                                ),
                              )
                            : SPHelper.empty,
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
                    topLeft: widget.topRadius
                        ? Radius.circular(widget.radius)
                        : const Radius.circular(0),
                    topRight: widget.topRadius
                        ? Radius.circular(widget.radius)
                        : const Radius.circular(0),
                    bottomLeft: widget.bottomRadius
                        ? Radius.circular(widget.radius)
                        : const Radius.circular(0),
                    bottomRight: widget.bottomRadius
                        ? Radius.circular(widget.radius)
                        : const Radius.circular(0),
                  ),
                ),
                child: Column(
                  children: [
                    expand ? SPHelper.getDefaultHeightBox() : SPHelper.empty,
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoDatePicker(
                        use24hFormat: true,
                        initialDateTime: widget.dateTime,
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (DateTime value) {
                          setState(() {
                            current = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                expand = !expand;
                              });
                            },
                            child: Text(
                              '关闭',
                              style: TextStyle(
                                fontSize: SPHelper.sp(SPHelper.gapDp18),
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              widget.onValueChanged!(current);

                              setState(() {
                                expand = false;
                              });
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '确定',
                                style: TextStyle(
                                  fontSize: SPHelper.sp(SPHelper.gapDp18),
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : SPHelper.empty,
      ],
    );
  }
}

class SimpleTileHasTime extends StatefulWidget {
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
  final Widget? leading;
  final String title;
  final Widget? subTitle;
  final Widget? trailing;
  final Duration duration;
  final VoidCallback? onPressed;
  final Function(Duration)? onValueChanged;

  const SimpleTileHasTime({
    super.key,
    required this.title,
    required this.duration,
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
    this.leading,
    this.trailing,
    this.subTitle,
    this.onPressed,
    this.onValueChanged,
  });

  @override
  State<StatefulWidget> createState() => _SimpleTileHasTimeState();
}

class _SimpleTileHasTimeState extends State<SimpleTileHasTime> {
  late bool expand;

  @override
  void initState() {
    super.initState();
    expand = false;
  }

  // String getTimer() {
  //   return DatetimeUtil.getHorTime(widget.dateTime);
  // }

  @override
  Widget build(BuildContext context) {
    return widget.hide
        ? SPHelper.empty
        : Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: widget.height + 1,
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
                        widget.leading == null
                            ? Container()
                            : Container(
                                padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: widget.leading,
                              ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                widget.title,
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
                                            Container(
                                              child: widget.subTitle,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 12, 0),
                                      child: widget.trailing ?? SPHelper.empty,
                                    ),
                                    widget.showArrow
                                        ? Container(
                                            alignment: Alignment.center,
                                            height: widget.height,
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              12,
                                              0,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              size: 18,
                                              color:
                                                  CupertinoColors.systemGrey4,
                                            ),
                                          )
                                        : SPHelper.empty,
                                  ],
                                ),
                              ),
                              expand
                                  ? const Divider(
                                      color: CupertinoColors
                                          .systemGroupedBackground,
                                      height: 1,
                                    )
                                  : widget.showDivider
                                      ? const Divider(
                                          color: CupertinoColors
                                              .systemGroupedBackground,
                                          height: 1,
                                        )
                                      : SPHelper.empty
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              expand
                  ? Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: widget.bottomRadius
                              ? Radius.circular(widget.radius)
                              : const Radius.circular(0),
                          bottomRight: widget.bottomRadius
                              ? Radius.circular(widget.radius)
                              : const Radius.circular(0),
                        ),
                      ),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoDatePicker(
                          use24hFormat: true,
                          initialDateTime: DateTime.fromMillisecondsSinceEpoch(
                            widget.duration.inMilliseconds,
                            isUtc: true,
                          ),
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (DateTime value) {
                            widget.onValueChanged!(
                              Duration(
                                seconds:
                                    value.hour * 60 * 60 + value.minute * 60,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : SPHelper.empty,
            ],
          );
  }
}
