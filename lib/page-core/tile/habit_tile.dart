import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitTile extends StatefulWidget {
  final double height;
  final double radius;
  final bool bottomRadius;
  final bool topRadius;
  final String leading;
  final String title;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final bool abandon;

  const HabitTile({
    super.key,
    required this.title,
    required this.leading,
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
    return GestureDetector(
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
                child: SvgLoader(
                  path: widget.leading,
                  size: SPHelper.sp(SPHelper.fontSp26),
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
    );
  }
}
