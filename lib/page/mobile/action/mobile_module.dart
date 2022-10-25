import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

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
                padding: EdgeInsets.fromLTRB(
                  SPHelper.height(SPHelper.gapDp18),
                  0,
                  0,
                  0,
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.fontSp18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.onPressed,
                child: Text(
                  '全部',
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.fontSp16),
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
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
