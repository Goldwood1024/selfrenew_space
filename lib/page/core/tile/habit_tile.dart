import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class HabitTile extends StatefulWidget {
  final double height;
  final double radius;
  final bool bottomRadius;
  final bool topRadius;
  final Color backgroundColor;
  final Widget? leading;
  final String title;
  final Widget? subTitle;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final bool abandon;

  const HabitTile({
    super.key,
    required this.title,
    this.height = 52.0,
    this.radius = 12.0,
    this.bottomRadius = false,
    this.topRadius = false,
    this.abandon = false,
    this.backgroundColor = Colors.white,
    this.leading,
    this.trailing,
    this.subTitle,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.leading == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.fromLTRB(
                          SPHelper.width(SPHelper.gapDp20),
                          SPHelper.width(SPHelper.gapDp14),
                          0,
                          0),
                      alignment: Alignment.center,
                      child: widget.leading,
                    ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          SPHelper.width(SPHelper.gapDp12),
                          SPHelper.width(SPHelper.gapDp12),
                          0,
                          0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.title,
                                // softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  decoration: widget.abandon
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  fontSize: SPHelper.sp(SPHelper.fontSp18),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, 0, SPHelper.width(SPHelper.gapDp20), 0),
                            child: widget.trailing ?? Container(),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Routers.go(Routers.habitStatistics);
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          SPHelper.width(SPHelper.gapDp12),
                          0,
                          0,
                          SPHelper.width(SPHelper.gapDp12),
                        ),
                        child: Container(
                          child: widget.subTitle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
