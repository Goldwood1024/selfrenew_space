import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitTile extends StatefulWidget {
  final double height;
  final double radius;
  final bool bottomRadius;
  final bool topRadius;
  final String leading;
  final String title;
  final String color;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final Function() onBackout;
  final bool abandon;

  const HabitTile({
    super.key,
    required this.title,
    required this.color,
    required this.leading,
    required this.onBackout,
    this.height = 52.0,
    this.radius = 12.0,
    this.bottomRadius = false,
    this.topRadius = false,
    this.abandon = false,
    this.trailing,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            icon: CupertinoIcons.reply,
            label: '撤销',
            backgroundColor: HexColor('#f7dc66'),
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
            onPressed: (_) => widget.onBackout(),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: widget.height,
          child: Container(
            alignment: Alignment.center,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      SPHelper.width(SPHelper.gapDp20), 0, 0, 0),
                  child: Container(
                    padding: const EdgeInsets.all(SPHelper.gapDp6),
                    height: SPHelper.height(SPHelper.gapDp36),
                    width: SPHelper.height(SPHelper.gapDp36),
                    decoration: BoxDecoration(
                      color: HexColor(widget.color),
                      shape: BoxShape.circle,
                    ),
                    child: SvgLoader(
                      path: widget.leading,
                      size: SPHelper.sp(SPHelper.fontSp26),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        SPHelper.width(SPHelper.gapDp14), 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: SPHelper.sp(SPHelper.fontSp18),
                        color: Theme.of(context).textTheme.labelSmall!.color,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, 0, SPHelper.width(SPHelper.gapDp20), 0),
                  child: widget.trailing ?? SPHelper.empty,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HabitHomeTile extends StatefulWidget {
  final double height;
  final double radius;
  final bool bottomRadius;
  final bool topRadius;
  final Widget? leading;
  final String title;
  final String id;
  final Widget? subTitle;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final bool abandon;

  const HabitHomeTile({
    super.key,
    required this.id,
    required this.title,
    this.height = 52.0,
    this.radius = 12.0,
    this.bottomRadius = false,
    this.topRadius = false,
    this.abandon = false,
    this.leading,
    this.trailing,
    this.subTitle,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _HabitHomeTileState();
}

class _HabitHomeTileState extends State<HabitHomeTile> {
  @override
  Widget build(BuildContext context) {
    HabitProvider habitProviderUpdate = Provider.of(context, listen: false);

    return Slidable(
      startActionPane: widget.abandon
          ? ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  onPressed: (_) {
                    habitProviderUpdate.delete(widget.id);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_rounded,
                  borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
                  label: '删除',
                ),
              ],
            )
          : ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    habitProviderUpdate.delete(widget.id);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_rounded,
                  borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
                  label: '删除',
                ),
                SlidableAction(
                  onPressed: (_) {
                    habitProviderUpdate.giveUp(widget.id, true);
                  },
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
                  icon: Icons.pause_circle_filled_outlined,
                  label: '放弃',
                )
              ],
            ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          widget.abandon
              ? SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
                  icon: CupertinoIcons.arrowshape_turn_up_left_fill,
                  label: '恢复',
                )
              : SlidableAction(
                  onPressed: (_) {
                    Routers.pushParams(Routers.habitForm, {
                      'id': widget.id,
                    });
                  },
                  backgroundColor: HexColor('#ff9248'),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
                  icon: Icons.mode_edit_rounded,
                  label: '编辑',
                ),
        ],
      ),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
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
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    decoration: widget.abandon
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    fontSize: SPHelper.sp(SPHelper.fontSp18),
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .color,
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
                          Routers.push(Routers.habitStatistics);
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
      ),
    );
  }
}
