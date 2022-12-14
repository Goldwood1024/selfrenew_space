import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class SimpleTile extends StatefulWidget {
  final double height;
  final double radius;
  final bool bottomRadius;
  final bool topRadius;
  final bool showArrow;
  final bool showDivider;
  final bool hide;

  // final Color backgroundColor;
  final Widget? leading;
  final String title;
  final Widget? subTitle;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const SimpleTile({
    super.key,
    required this.title,
    this.height = 52.0,
    this.radius = 12.0,
    this.bottomRadius = false,
    this.topRadius = false,
    this.hide = false,
    this.showArrow = true,
    this.showDivider = true,
    this.leading,
    this.trailing,
    this.subTitle,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _SimpleTileState();
}

class _SimpleTileState extends State<SimpleTile> {
  @override
  Widget build(BuildContext context) {
    return widget.hide
        ? SPHelper.empty
        : GestureDetector(
            onTap: widget.onPressed,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 0, 0, 0),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 12, 0),
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
                                          color: CupertinoColors.systemGrey4,
                                        ),
                                      )
                                    : SPHelper.empty,
                              ],
                            ),
                          ),
                          widget.showDivider
                              ? Divider(
                                  color: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .color!
                                      .withOpacity(.1),
                                  height: .2,
                                )
                              : SPHelper.empty
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
