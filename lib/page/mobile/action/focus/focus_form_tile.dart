import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusFormTile extends StatefulWidget {
  final String title;
  final String tail;
  final BorderRadius borderRadius;
  final GestureTapCallback onTap;

  const FocusFormTile({
    super.key,
    required this.title,
    required this.tail,
    required this.borderRadius,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _FocusFormTileState();
}

class _FocusFormTileState extends State<FocusFormTile>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SPHelper.height(
        SPHelper.gapDp56,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.borderRadius,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:
                EdgeInsets.fromLTRB(SPHelper.pageHorizontalPadding(), 0, 0, 0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: SPHelper.sp(
                  SPHelper.fontSp16,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: widget.onTap,
            child: Row(
              children: [
                Text(
                  widget.tail,
                  style: TextStyle(
                    fontSize: SPHelper.sp(
                      SPHelper.fontSp16,
                    ),
                    color: CupertinoColors.systemGrey2,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(
                    SPHelper.pageHorizontalPadding(),
                    0,
                    SPHelper.pageHorizontalPadding(),
                    0,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: SPHelper.sp(SPHelper.fontSp16),
                    color: CupertinoColors.systemGrey2,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
