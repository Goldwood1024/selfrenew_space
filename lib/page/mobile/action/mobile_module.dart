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
      margin: EdgeInsets.fromLTRB(0, SPHelper.height(SPHelper.gapDp32), 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: SPHelper.sp(SPHelper.fontSp24),
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: widget.onPressed,
                child: Text(
                  '显示更多',
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
              SPHelper.height(SPHelper.gapDp20),
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
