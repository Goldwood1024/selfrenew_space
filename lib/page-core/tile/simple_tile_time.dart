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
