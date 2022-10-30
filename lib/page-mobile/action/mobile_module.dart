import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class MobileModule extends StatefulWidget {
  final String title;
  final Widget child;
  final VoidCallback? onPressed;

  const MobileModule({
    super.key,
    required this.title,
    required this.child,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _MobileModuleState();
}

class _MobileModuleState extends State<MobileModule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, SPHelper.height(SPHelper.gapDp24), 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.fontSp22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: GestureDetector(
                  onTap: widget.onPressed,
                  child: Text(
                    '查看全部',
                    style: TextStyle(
                      fontSize: SPHelper.sp(SPHelper.fontSp18),
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              0,
              SPHelper.height(SPHelper.gapDp12),
              0,
              0,
            ),
            decoration: const BoxDecoration(),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
